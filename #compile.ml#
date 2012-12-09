
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

(* trouvez la taille d'une union dans l'environement *)
(**
 f : fonction qui calcule la taille
 id : id de la structurel'union
*)

let find_u_size f id = 
  try
    let size = Hashtbl.find union_size id in size
  with 
    Not_found ->
      begin
        let x = Hashtbl.find  union_env id in
        let s = f x
        in Hashtbl.add union_size id s;s
      end

(* trouvez la taille d'une structure dans l'environement *)
(**
 f : fonction qui calcule la taille
 id : id de la structure
*)
let find_s_size f id = 
  try
    let size,declage_env = Hashtbl.find struct_size id in size
  with 
    Not_found ->
      begin
        let x = Hashtbl.find  struct_env id in
        let s,declage_env = f x
        in Hashtbl.add struct_size id (s,declage_env);s
      end

(* calcule de la taille et decalages dans structure *)
let rec get_struct_size s =
  let decl = Hashtbl.create 107
  in
  let z =
    List.fold_left 
      (fun acc (t,id) -> 
	let s =
          match t with
            |Tchar -> 
	      acc +1 
		
            |Tint | Tpointer _ -> 
	      (acc+(acc mod 4)) + 4
		
	    |Tstruct sid ->
              (acc+(acc mod 4)) + (find_s_size get_struct_size sid.node)
		
            |Tunion uid ->
              (acc+(acc mod 4)) + (find_u_size get_union_size uid.node)
	    
            |_ -> acc
	in
	let () = Hashtbl.add decl id.node (t,acc) in
	s   
      ) 0 s
  in (z + (z mod 4),decl)

and get_size  = function
  |Tchar -> 1
  
  |Tint |Tpointer _ ->4
    
  |Tunion y ->
    (find_s_size get_struct_size y.node)
  
  |Tstruct y  ->
    (find_u_size get_union_size y.node)
      
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

(* partie expression ---------------------------------------------------------------------------*)   
let msg = ref " Rien n'est declarer"

let prog = {text = nop; data = [] }
exception Haha
(*fonctions plus*)
(*----------------------------------------------------------------------------------------*)
let cont_as = ref 0
let get_nb_label cont_as =
let () = incr cont_as in
string_of_int !cont_as
  
let string_const = ref []
  
let ajouter_string x = 
  let label = "String_const"^(get_nb_label cont_as )
  in
  let () =
    string_const:= !string_const 
    @[Dlabel label ]@ x in 
  label
    
let get_position s id = assert false
let popn n = Binop(Add,SP,SP,Oimm n)
let pushn n = Binop(Sub,SP,SP,Oimm n)
let push = pushn 4
let pop = popn 4
let arrondir_4 x = ((x+3)/4)*4
(*push_s_t permet de transferer les donne .on supose que addres de depart
  est deja dans regisgre AO addrese de destination est dans sp
tous sont aligne .il faut empiler apres   negative!!!!!!*)
let rec push_s_t source taille position = 
  match taille with
    |1 -> [Lbu(A1,Areg(source,A0));Sb(A1,Areg(position,SP))]
    |4 -> [Lw(A1,Areg(source,A0));Sw(A1,Areg(position,SP))]
    |x -> 
      begin
	let decalage = if x > 4 then 4 else 1 in
	(push_s_t source decalage position )
	@ (push_s_t (source+decalage) (taille-decalage) (position+decalage))
      end
(*A0 je met addrese de source  A1 je met addrese de destination addrse sont alignement*)
let rec lire taille position = match taille with
  |1 -> [Lbu(T0,Areg (position,A0));Sb(T0,Areg(position,A1))]
  |4 -> [Lw(T0,Areg (position,A0));Sw(T0,Areg(position,A1))]
  |x ->
    begin
      let deca = if x>4 then 4 else 1 in
      lire deca position @ lire (taille-deca) (position+deca)
    end
      
(*------------------------------------------------------------------------------------------*)

let logique =function
  |Band|Bor ->[Lw(A0,Areg(0,SP));Binop(Ne,A0,A0,Oreg( ZERO));Sw(A0,Areg(0,SP))]
  |_ -> []
let rec  compile_gauche env e =
match e.node with
|Eident id ->
  begin
    try
      let fp = StrMap.find id.node env in
      [Comment "deb gauche";push;Binop(Add,A0,FP,Oimm(fp));Sw(A0,Areg(0,SP));Comment "fin gauche"]
    with Not_found ->
      if not (Hashtbl.mem genv id.node) then raise Haha;
      [Comment "deb gauche";push;La(A0,id.node);Sw(A0,Areg(0,SP));Comment "fin gauche"]
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
      |Cstring s -> 
	begin
	  let label = (ajouter_string [(Dasciiz( s^"\\0"))]) in
	  [push;
	   La(A0,label);
	   Sw(A0,Areg(0,SP))]
	end
  end    

|Eassign (e1,e2) ->
  begin
    let r2 = compile_expr env e2
    in
    let r1 = compile_gauche env e1
    in
    let st = 
      match e1.loc with
      (* |Tchar ->
	 [Lw(A0,Areg(4,SP));
	 Lbu(A1,Areg(0,SP));
	 pop;
	 Sb(A1,Areg(0,A0));
	 Sb(A1,Areg(3,SP))
	 ]*)
	|Tchar|Tint|Tpointer _ ->
	  [Lw(A0,Areg(4,SP));
	   Lw(A1,Areg(0,SP));
	   pop;
	   Sw(A1,Areg(0,A0));
	   Sw(A1,Areg(0,SP))
	  ]
	|_ ->[]
    in
    r1@r2@st
  end
    
|Esizeof x ->
  begin   
    let taille = get_size x in
    [push;Li(A0,taille);Sw(A0,Areg(0,SP))]
  end

|Eident x ->
  begin
    let taille = get_size e.loc in
    let addrese = begin
      try
	let fp = StrMap.find x.node env in
	[push;Binop(Add,A0,FP,Oimm(fp));Sw(A0,Areg(0,SP))]
      with Not_found ->
	if not (Hashtbl.mem genv x.node) then raise Haha;
	[push;La(A0,x.node);Sw(A0,Areg(0,SP))]
    end
      in
    addrese@[Lw(A0,Areg(0,SP));pop]@ [(pushn (arrondir_4 taille))]@(push_s_t 0 taille 0)
    (* begin
       try
       let fp = StrMap.find x.node env in
       [push;Lw(A0,Areg(fp,FP));Sw(A0,Areg(0,SP))]
       with Not_found ->
       if not (Hashtbl.mem genv x.node) then raise Haha;
       [push;Lw(A0,Alab x.node);Sw(A0,Areg(0,SP))]
       end*)
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
      let com_gauche = compile_gauche env ex in
      let p = get_position ex.loc id.node in
      [Lw(A0,Areg(0,SP));pop;Binop(Sub,A0,A0,Oimm p)]@ []
  end 
    
|Ecall(id,iel) ->
  let taille_retour =arrondir_4 (get_size e.loc) in
  let taille =
    List.fold_left 
      (fun acc x->(arrondir_4 (get_size x.loc))+acc)
      0 iel in
  let reserver_taille_retour =
    [Comment "taille retour";Binop(Add,SP,SP,Oimm(-taille_retour));Comment "args "] in
  let list_list = List.map (compile_expr env) iel 
  in
  let passer_arg = List.concat list_list
  in 
  let appler = [Comment "args fin";Jal(id.node)]
  in
  let resultat = 
    if (taille_retour > 0) then
      [Sw(V0,Areg(0,SP))]
    else []
  in
  let apres_appel = [Binop(Add,SP,SP,Oimm(taille))] 
  in
  reserver_taille_retour@ passer_arg @ appler @ apres_appel
    
(* pour les label de boucle et de branchement *)
let cont_br = ref 0
let loop_count = ref 0

let get_nb_br nc =
  let () = incr nc in
  string_of_int !nc

(* fonction pour sauvgarde de resultat dans l'emplacement dedier sur la pile *)
(**
 t : type du resultat a sauvgarder
 lwdec : position du sp a partir de la quelle on copie
 swdec : position du la place du resultat par raport a fp
*)
let rec save_with_out_erase t lwdec swdec =
match t with
  |Tint|Tnull|Tpointer _ -> [Lw(T0,Areg(lwdec,SP));Sw(T0,Areg(swdec,FP))]

  |Tchar -> [Lbu(T0,Areg(lwdec,SP));Sb(T0,Areg(swdec,FP))]

  |Tvoid -> []

  |Tstruct sid ->
    begin
      let s,dec_env = Hashtbl.find struct_size sid.node in
      let copie_all = 
	Hashtbl.fold 
	  (fun id (t,dec) acc ->	    
	   (save_with_out_erase t (lwdec + s - dec) (swdec + s - dec))  @ acc
	  ) dec_env []
      in copie_all
    end

  |Tunion uid ->
    assert false (*a revoir*)
    (* an other pb *)
(**
 t : type du resultat a sauvgarder
 taille : des argumens plus 8 sur la pile
*)
let save_result t args_dec = 
match t with 
  |Tint|Tnull|Tpointer _ -> [Lw(T0,Areg(0,SP));Sw(T0,Areg(args_dec+4,FP));pop]

  |Tchar -> [Lbu(T0,Areg(0,SP));Sb(T0,Areg(args_dec+1,FP));Binop(Add,SP,SP,Oimm 1)]

  |Tvoid -> []

  |Tstruct sid ->
    begin
      let s,dec = Hashtbl.find struct_size sid.node in
      let copie_all = 
	save_with_out_erase t 0 args_dec
      in
      copie_all @ [Binop(Add,SP,SP,Oimm s)]      
    end

  |Tunion uid ->
    let s = Hashtbl.find union_size in
    assert false (* a revoir*)
(*----------------------------------------------------------------------------------------*)
(* compilation d'instructions *)
let rec compile_stmt env tframe (t_fun,dec_args) i =
match i.node with
|Sskip -> []
|Sexpr e ->
  let taille = get_size e.loc in
  (compile_expr env e) @[ (Binop(Add,SP,SP,Oimm taille))]         (* [pop]*)
|Sif (e,s1,s2) ->
  let res = compile_expr env e 
  in
  let n = (get_nb_br cont_br)
  in
  let label1 = "True_branch_"^n
  in
  let label2 = "Fin_du_branch_"^n
  in  
  let s1 = compile_stmt env tframe (t_fun,dec_args) s1
  in
  let s2 = compile_stmt env tframe (t_fun,dec_args) s2
  in
  let test = [pop;Bnez (A0,label1)](* si il ya un pb rajouter le load dans a0 *)
  in
  res@test @ s2@ ( B label2::Label (label1)::s1@ [Label label2])

|Swhile (e,s) ->
  let res = compile_expr env  e
  in
  let n = (get_nb_br loop_count)
  in
  let label1 = "loop_start_"^n
  in
  let label2 = "loop_end_"^n
  in
  let s = compile_stmt env tframe (t_fun,dec_args) s
  in
  let test = [Lw(A0,Areg(0,SP));pop;Beqz (A0,label2)]
  in
  Label label1::res@ test @ s @ [B label1;Label label2]
  
|Sfor (stl1,e,stl2,s) ->
  let stmt1 = List.concat (List.map (compile_stmt env tframe (t_fun,dec_args) ) stl1)
  in
  let stmt2 = List.concat (List.map (compile_stmt env tframe (t_fun,dec_args) ) stl2)
  in
  let n = (get_nb_br loop_count)
  in
  let label1 = "loop_start_"^n
  in
  let label2 = "loop_end_"^n
  in
  let res = compile_expr env e
  in
  let test = [Lw(A0,Areg(0,SP));pop;Beqz (A0,label2)]
  in
  let core = compile_stmt env tframe (t_fun,dec_args) s 
  in
  stmt1@ ((Label label1)::res)@ test @ core@stmt2@[B label1;Label label2]

|Sblock  block (*il faut compter les valeur a refaire !!!!!*)->
  let changer = ref tframe
  in 
  let env = List.fold_left 
    (fun env (t,id) -> 
      let s =  !changer  in 
      changer := s + (get_size t) ;
      StrMap.add id.node s  env) env (fst block) 
  in
  let stm = List.map (compile_stmt env tframe (t_fun,dec_args) ) (snd block)
  in
  List.concat stm 

|Sreturn r -> (*arefaire !!!!!*)
  begin
    let exit_code  =
      [Lw(RA,Areg(0,FP));
       Lw(FP,Areg(4,FP)); 
       Binop(Add,SP,SP,Oimm (8+tframe))             
       ]
    in
    match r with
    | Some s -> 
      let e = compile_expr env s 
      in
      e@ (save_result t_fun dec_args) @ exit_code @ [Jr RA] 
    (* a mettre la taille de la frame*)
    | None -> 
      exit_code @ [Jr RA]
  (* a mettre la taille de la frame*)
  end



(* vd signfi variable declaration ------ a reffaire !!!!!!!!!*) 
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
		    |Tnull|Tvoid -> [] 
		    


let compile_block env (t_fun,dec_args) block = 
  let frame = ref 4
  in   
  let env = List.fold_left 
    (fun env (t,id) -> 
      let s = !frame  in      
      let env = StrMap.add id.node (-s)  env
      (* position par rapport fp est negatif *)
      in
      frame := s + arrondir_4 (get_size t); env ) env (fst block) 
  in
  let stm = 
    List.fold_left 
      (fun acc i -> 
	acc ++(mips (compile_stmt env (!frame -4) (t_fun,dec_args) i))
      ) nop (snd block)
  in
   stm ++ mips [Comment "fin block"],( !frame -4) (*  je crois la taille de  frame !=  !frame *)


let predfun = 
  let putchar =
    let label = Label "putchar"
    in
    label::
      [Lw (A0, Areg(0,SP));
       Sw(A0,Areg(4,SP));
       Li(V0,11);Syscall;     
       Move (V0,A0) ;
       Jr RA ]    
  in
  let sbrk = 
    [Label "sbrk";
     Li(V0,9);
     Lw(A0,Areg(0,SP));
     Syscall;     
     Jr RA]
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
        let () = dec_args := !dec_args + arrondir_4 (get_size(t)) in
        StrMap.add id.node s env)
      dvl StrMap.empty 
  in
  (* compilation du core de la fonction *)
  let core,tframe = compile_block env (t,!dec_args -4) infb
  in
  let data = prog.data;
  in
  let frame = mips [Binop (Sub,SP,SP,Oimm (arrondir_4 tframe));Comment "begin block"]
  in
  let save = mips [push;
                   Sw (FP,Areg((0),SP));
                   push;
                   Move(FP,SP);
                   Sw (RA,Areg(0,FP));] 
  in
  let exit_code  =
    if (t = Tvoid) || ((String.compare id.node "prog_main") = 0 ) then
      mips 
	[Lw(RA,Areg(0,FP));
	 Lw(FP,Areg(4,FP)); 
	 Binop(Add,SP,SP,Oimm (8+tframe));
	 Jr RA             
	]
    else 
      nop
  in
  let code = prog.text ++ label ++ save ++ frame ++ core
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
    {text = main ++ sortie.text ++ predfun; data = sortie.data @ !string_const}
  with _ ->
    failwith !msg 
