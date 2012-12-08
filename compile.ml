
open Ast
open Typing
open Mips

let struct_env = Typing.struct_env 

let union_env = Typing.union_env

let struct_size = Hashtbl.create 1007

let union_size = Hashtbl.create 1007

module StrMap = Map.Make(String)

let (genv : (string ,unit) Hashtbl.t) = Hashtbl.create 1007

let data_list = []

let try_or_use id f t_size t_env = 
  try
    let size = Hashtbl.find t_size id in size
  with 
    Not_found ->
      begin
        let x = Hashtbl.find  t_env id in
        let s = f x
        in Hashtbl.add t_size id s;s
      end

let rec get_struct_size s =
  let z =
    List.fold_left 
      (fun acc (t,_) -> 
        match t with
        |Tchar -> acc+1
        |Tint | Tpointer _ -> 
          ((acc+(acc mod 4)) + 4)
        |Tstruct sid ->
          try_or_use sid.node get_struct_size struct_size struct_env 
        |Tunion uid ->
          try_or_use uid.node get_union_size union_size union_env 
        | _ -> 0
      ) 0 s
  in z + (z mod 4)

and  get_size  = function
|Tchar -> 1
|Tint |Tpointer _ ->4
|Tunion y ->
  try_or_use y.node get_union_size union_size union_env 
|Tstruct y  ->
  try_or_use y.node get_struct_size struct_size struct_env 

|_ -> 0 (*on va rattraper les autres cas *)

(*fonction calcule la taille de structure union*)
and  get_union_size list_decl = 
  begin
    let max = ref 0 in
    let comp (t,id) =
      begin
	let taille = get_size t      
        in
	if !max < taille then max :=taille
      end
    in (* pb a regler ne met pas a jour la taille des unions *)
    let ()= List.iter comp list_decl in
   ( (!max + 3)/4)*4 
  end


let size_all_struct sl = 
  Hashtbl.iter (fun id dvl -> Hashtbl.add struct_size id (get_struct_size dvl)) sl 

let msg = ref " Rien n'est declarer"

let print =
  Hashtbl.iter 
    (fun id s -> msg := " Struct : "^id ^", size : "^string_of_int(s) ) struct_size


let prog = {text = nop; data = [] }
exception Haha

let push = Binop(Sub,SP,SP,Oimm 4)
let pop = Binop(Add,SP,SP,Oimm 4)

let logique =function
  |Band|Bor ->[Lw(A0,Areg(0,SP));Binop(Ne,A0,A0,Oreg( ZERO));Sw(A0,Areg(0,SP))]
  |_ -> []
let rec  compile_gauche env e =
match e.node with
|Eident id ->
  begin
    try
      let fp = StrMap.find id.node env in
      [push;Binop(Add,A0,FP,Oimm(fp));Sw(A0,Areg(0,SP))]
    with Not_found ->
      if not (Hashtbl.mem genv id.node) then raise Haha;
      [push;La(A0,id.node);Sw(A0,Areg(0,SP))]
  end
|Eunop (Ustar ,expr) ->compile_expr env  expr
|_ -> []
and
 compile_expr env e =
match e.node with
|Enull ->[push;Li(A0,0);Sw(A0,Areg(0,SP))]
|Econst c -> 
  begin
    match c with
    |Cint i -> [push;Li(A0,Int32.to_int i);Sw(A0,Areg(0,SP))]
    |Cstring s ->[push;La(A0,s);Sw(A0,Areg(0,SP))]
  end
|Eassign (e1,e2) ->
begin
  let r2 = compile_expr env e2
  in
  let r1 = compile_gauche env e1
  in
  r1@r2@
    [Lw(A0,Areg(4,SP));
     Lw(A1,Areg(0,SP));
     pop;
     Sw(A1,Areg(0,A0));
     Sw(A1,Areg(0,SP))
    ]
end
|Esizeof x ->
        begin   
        let taille = get_size x in
        [push;Li(A0,taille);Sw(A0,Areg(0,SP))]
        end
|Eident x ->
        begin
        try
        let fp = StrMap.find x.node env in
        [push;Lw(A0,Areg(fp,FP));Sw(A0,Areg(0,SP))]
        with Not_found ->
        if not (Hashtbl.mem genv x.node) then raise Haha;
        [push;Lw(A0,Alab x.node);Sw(A0,Areg(0,SP))]
        end
|Ebinop (op,e1,e2) ->
  begin
    let operation = match op with
      |Badd -> Mips.Add
      |Bsub -> Mips.Sub
      |Bmul -> Mips.Mul
      |Bdiv -> Mips.Div
      |Beq  -> Mips.Eq
      |Bneq -> Mips.Ne
      |Blt  -> Mips.Lt
      |Ble  -> Mips.Le
      |Bgt  -> Mips.Gt
      |Bge  -> Mips.Ge
      |Bmod -> Mips.Rem
      |Band -> Mips.Mul
      |Bor  -> Mips.Add
      |_ -> assert false
    in
    let code_e1 = compile_expr env e1 in
    let code_e2 = compile_expr env e2 in
    
   code_e1 @ code_e2 @ 
      [Lw(A0,Areg(4,SP));
       Lw(A1,Areg(0,SP));
       pop;
       Binop(operation,A0,A0,Oreg A1);
       Sw(A0,Areg(0,SP));
      ]@(logique op)
   
  end
|Eunop (op,expr) ->
  let com_expr = compile_expr env expr in
  let com_expr_gauche = compile_gauche env expr in
  let nombre e = 
    if is_pointer e.loc 
    then 4
    else 1
  in
  let var = nombre expr in
  let incre = [Lw(A0,Areg(0,SP));Binop(Add,A0,A0,Oimm(var))] in
  let de_incre = [Lw(A0,Areg(0,SP));Binop(Sub,A0,A0,Oimm(var))] in
  let enrgister = [Lw(A1,Areg(4,SP));Sw(A0,Areg(0,A1))] in
  let post = [Lw(A0,Areg(0,SP));Sw(A0,Areg(4,SP)) ] in
  let pre = [Sw(A0,Areg(4,SP));] in
  let changer = match op with
    |Upre_inc ->incre@  enrgister@pre
    |Upost_inc->incre@ enrgister@post
    |Upre_dec->de_incre@ enrgister@pre
    |Upost_dec-> de_incre@ enrgister@post	
    |_ -> [Inline "op un "] 
  in
  begin
    match op with
    |Upre_inc | Upost_inc | Upre_dec | Upost_dec
      ->com_expr_gauche@com_expr@changer@[pop]
    |Ustar  -> com_expr @[Lw(A0,Areg(0,SP));Lw(A0,Areg(0,A0));Sw(A0,Areg(0,SP))]
    |Uplus  -> com_expr
    |Uminus -> com_expr @[Lw(A0,Areg(0,SP));Binop(Sub,A0,ZERO,Oreg( A0));Sw(A0,Areg(0,SP))]
    |Unot  ->com_expr @[ Lw(A0,Areg(0,SP));Binop(Eq,A0,ZERO,Oreg( A0));Sw(A0,Areg(0,SP))] 
    |Uamp  -> com_expr_gauche
  end
  |Edot(ex,id) ->
    begin
      let com_gauche = compile_gauche env ex
      in 
      []
    end 
  |Ecall(id,iel) ->
    let taille_retour = get_size e.loc in
    let taille = List.fold_left (fun acc x->(get_size x.loc)+acc) 0 iel in
    let reserver_taille_retour = [Binop(Add,SP,SP,Oimm(-taille_retour))] in
    let list_list = List.map (compile_expr env) iel 
    in
    let passer_arg = List.concat list_list
    in 
    let appler = [Jal(id.node)]
    in
    let resultat = 
      if (taille_retour > 0) then
        [Sw(V0,Areg(0,SP))]
      else []
    in
    let apres_appel = [Binop(Add,SP,SP,Oimm(taille))]@resultat 
    in
    reserver_taille_retour@ passer_arg @ appler @ apres_appel
    

let cont_br = ref 0
let loop_count = ref 0

let get_nb_br nc =
  let () = incr nc in
  string_of_int !nc

let rec compile_stmt env i =
match i.node with
|Sskip -> []
|Sexpr e -> let taille = get_size e.loc in
 (compile_expr env e) @[ (Binop(Add,SP,SP,Oimm taille))]         (* [pop]*)
|Sif (e,s1,s2) ->
  let res = compile_expr env e 
  in
  let n = (get_nb_br cont_br)
  in
  let label1 = "True_branch_"^n
  in
  let label2 = "False_branch_"^n
  in
  let s1 = compile_stmt env s1
  in
  let s2 = compile_stmt env s2
  in
  res@Bnez (A0,label1)::s2@ ( B label2::Label (label1)::s1@ [Label label2])

|Swhile (e,s) ->
  let res = compile_expr env  e
  in
  let n = (get_nb_br loop_count)
  in
  let label1 = "loop_start_"^n
  in
  let label2 = "loop_end_"^n
  in
  let s = compile_stmt env s
  in
  Label label1::res@ (Beqz (A0,label2)::s@[B label1;Label label2])
  
|Sfor (stl1,e,stl2,s) ->
  let stmt1 = List.concat (List.map (compile_stmt env) stl1)
  in
  let stmt2 = List.concat (List.map (compile_stmt env) stl2)
  in
  let n = (get_nb_br loop_count)
  in
  let label1 = "loop_start_"^n
  in
  let label2 = "loop_end_"^n
  in
  let res = compile_expr env e
  in
  let core = compile_stmt env s
  in
  stmt1@ (Label label1::res@ (Beqz (A0,label2) ::core@stmt2@[B label1;Label label2]))

|Sblock  block ->
  let changer = ref 0
  in 
  let env = List.fold_left 
    (fun env (t,id) -> 
      let s =  !changer  in 
      changer := s + (get_size t) ;
      StrMap.add id.node s  env) env (fst block) 
  in
  let stm = List.map (compile_stmt env) (snd block)
  in
  List.concat stm 

|Sreturn r ->
  begin
    match r with
    | Some s -> 
      let e = compile_expr env s 
      in
      e@[Lw(V0,Areg(0,SP))] 
    (* a mettre la taille de la frame*)
    | None -> 
      []
  (* a mettre la taille de la frame*)
  end



(* vd signfi variable declaration *)
let recup_data vd = let ty = fst vd in
		    let id = snd vd in
		    let lab = Dlabel id.node in
                    let () = Hashtbl.add genv id.node ()
                      in
		    match ty with 
		    |Tint ->[lab;Dword [Int32.zero]]
		    |Tchar ->[lab;Dbyte 0]
		    |Tstruct id|Tunion id ->
		    begin
		      let taille = get_size ty in
		     [lab;Dspace taille]
		    end
		    |Tpointer cy ->[lab;Daddress id.node]


let compile_block env  block = 
  let frame = ref 4
  in   
  let env = List.fold_left 
    (fun env (t,id) -> 
      let s = !frame  in      
      let env = StrMap.add id.node (-s)  env  (* position par rapport fp est negatif *)
      in
      frame := s + (get_size t); env ) env (fst block) 
  in
  let stm = List.fold_left (fun acc i -> acc ++(mips (compile_stmt env i))) nop (snd block)
  in
   stm,( !frame -4) (*  je crois la taille de  frame !=  !frame *)


let predfun = 
  let putchar =
    let save = 
      [push;
        Sw (FP,Areg(0,SP));
        push;
        Move (FP,SP);
        Sw (RA,Areg(0,FP));] 
    in
    let label = Label "putchar"
    in
    label::
      [Lbu (A0, Areg(0,SP));
       Li(V0,11);Syscall;
      (* Lw(RA,Areg(0,FP));
       Binop(Sub,SP,SP,Oimm (8));*)
       Move (V0,A0) ;
       Jr RA ]
     (* [Lbu (A0, Areg(8,FP));Syscall;Lw(RA,Areg(0,FP));Binop(Sub,SP,SP,Oimm (8));Move (V0,A0) ;Jr RA ]*)
  in
  let sbrk = [ Label "sbrk";Li(V0,9);Lw(A0,Areg(0,SP));Syscall;Move(V0,A0);Jr RA]
  in
  mips (putchar @ sbrk)


let compile_data prog = function
|Dvars dvl -> 
  let res1 = List.map (fun v -> recup_data v ) dvl in
  let res =List.concat res1
  in {text = prog.text ; data = res}

| Dstruct (id, decls)  -> Hashtbl.add struct_env id.node decls;prog

| Dunion  (id, decls)  -> Hashtbl.add union_env  id.node decls;prog 

| Dfun (t,id,dvl,infb) -> 
  let label =   
      mips [Label id.node]
  in
  (* calcule des decalages d'arguments *)
  let dec_args = ref 8
  in 
  let env = 
    List.fold_right
      (fun (t,id) env -> 
        let s = !dec_args in
        let () = dec_args := !dec_args + get_size(t) in
        StrMap.add id.node s env)
      dvl StrMap.empty 
  in
  (* compilation du core de la fonction *)
  let core,tframe = compile_block env infb
  in
  let data = prog.data;
  in
  let frame = mips [Binop (Sub,SP,SP,Oimm (tframe))]
  in
  let save = mips [push;
                   Sw (FP,Areg((0),SP));
                   push;
                   Move(FP,SP);
                   Sw (RA,Areg(0,FP));] 
  in
  let code = prog.text ++ label ++ save ++ frame ++ core
  in
  let exit_code  =
   mips [Lw(RA,Areg(0,FP));Lw(FP,Areg(4,FP));Binop(Add,SP,SP,Oimm (8+tframe));Jr RA]
  in
  {text = code ++ exit_code ; data = data}
  
let main =
  mips
  [
    Label "main";    
    Jal "prog_main";  
    Li (V0,10);
    Syscall
  ]

let compile_file ast = 
  try
    let sortie =List.fold_left (fun acc d -> compile_data acc d) prog  ast 
    in 
    {text = main ++ sortie.text ++ predfun; data = sortie.data}
  with _ ->
    failwith !msg 
