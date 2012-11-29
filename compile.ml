
open Ast
open Typing
open Mips

let struct_env = Typing.struct_env 

let union_env = Typing.union_env

let struct_size = Hashtbl.create 1007

let union_size = Hashtbl.create 1007

module StrMap = Map.Make(String)

type funt = {retour : c_type ; dvl : var_decl list  }

let globfun = Hashtbl.create 107

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

let x = ref 0 
let rename id =  
  incr(x);{loc = id.loc ;node = id.node^string_of_int(!x)}





(*


let compile_decl d =
match d with
| Dvars dvl ->
  let res = 
    List.map 
      (fun  (t,id) -> 
        (t,rename id))  dvl
  in Dvars res

*)



let prog = {text = nop; data = [] }

let compile_gauche env e =
match e.node with
|Eident id -> []
|_ -> []
let push = Binop(Sub,SP,SP,Oimm 4)
let pop = Binop(Add,SP,SP,Oimm 4)
exception Haha


let rec compile_expr env e =
match e.node with
|Enull ->[]

|Econst c -> 
  begin
    match c with
    |Cint i -> [push;Li(A0,Int32.to_int i);Sw(A0,Areg(0,SP))]
    |Cstring s ->[]
  end
|Eassign (e1,e2) ->
  let r2 = compile_expr env e2
  in
  let r1 = compile_gauche  env e1
  in
  r1@r2
|Esizeof x ->
        begin   
        let taille = get_size x in
        [push;Li(A0,taille);Sw(A0,Areg(0,SP))]
        end
|Eident x ->
        begin
        try
        let fp = StrMap.find x.node env in
        [push;Lw(A0,Areg(-fp,FP));Sw(A0,Areg(0,SP))]
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
      |Band -> Mips.And
      |Bor  -> Mips.Or
      |_ -> assert false
    in
    let code_e1 = compile_expr env e1 in
    let code_e2 = compile_expr env e2 in
    code_e1 @ code_e2 
  end

|Eunop (op,expr) ->
  begin
    match op with
      |Upre_inc 
      |Upost_inc
      |Upre_dec
      |Upost_dec
      
      |_ -> []
  end
|_ ->[]
 

let cont_br = ref 0
let loop_count = ref 0

let get_nb_br nc =
  let () = incr nc in
  string_of_int !nc

let rec compile_stmt env i =

match i.node with
|Sskip -> []
|Sexpr e -> compile_expr env e
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
      let s = (get_size t) in 
      changer := s + !changer ;
      StrMap.add id.node  (!changer) env) env (fst block) 
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
      e@[Move (V0,A0);Lw(RA,Areg(0,FP));Binop(Sub,SP,SP,Oimm (0))] 
    (* a mettre la taille de la frame*)
    | None -> 
      [Lw(RA,Areg(0,FP));Binop(Sub,SP,SP,Oimm (0))]
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
		    |Tchar ->[lab;Dbyte 1]
		    |Tstruct id|Tunion id ->
		    begin
		      let taille = get_size ty in
		     [lab;Dspace taille]
		    end
		    |Tpointer cy ->[lab;Daddress id.node]


let compile_block env  block = 
  let frame = ref 0
  in   
  let env = List.fold_left 
    (fun env (t,id) -> 
      let s = (get_size t) in      
      let env = StrMap.add id.node  (!frame) env 
      in
      frame := s + !frame; env ) env (fst block) 
  in
  let stm = List.fold_left (fun acc i -> acc ++(mips (compile_stmt env i))) nop (snd block)
  in
   stm,!frame 

let predfun = 
  let putchar =
    let frame = Binop (Sub,SP,SP,Oimm 8)
    in
    let save =  [Sw (FP,Areg((-4),SP)); Binop (Add,FP,SP,Oimm(-8)); Sw (RA,Areg(0,FP));] 
    in
    let label = Label "putchar"
    in
    label::frame::save @
      [Li (V0,11) ; Lbu (A0, Areg(8,FP));Syscall;Lw(RA,Areg(0,FP));Binop(Sub,SP,SP,Oimm (8));Jr RA ]
  in
  let sbrk = [ Label "sbrk" ]
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
  let () =
    Hashtbl.add globfun id.node {retour = t; dvl = dvl} 
  in
  let label = mips [Label id.node] 
  in
  let core,tframe = compile_block StrMap.empty infb
  in
  let data = prog.data;
  in
  let frame = mips [Binop (Sub,SP,SP,Oimm (tframe+8))]
  in
  let save = mips [Sw (FP,Areg((4-tframe),SP)); Binop (Add,FP,SP,Oimm(8-tframe)); Sw (RA,Areg(0,FP));] 
  in
  let code = prog.text ++ label ++ frame ++ save ++ core
  in
  let exit_code s =
    if ((String.compare s "main") = 0 ) then
     mips [Move (T1,V0);Li (V0,10);Syscall]
    else mips [Jr RA]
  in
  {text = code ++ (exit_code id.node) ; data = data}
  


let compile_file ast = 
  try
    let sortie =List.fold_left (fun acc d -> compile_data acc d) prog  ast 
    in 
    {text = sortie.text ++ predfun; data = sortie.data}
  with _ ->
    failwith !msg 
