
open Ast
open Typing
open Mips

let struct_env = Typing.struct_env 

let union_env = Typing.union_env

let struct_size = Hashtbl.create 1007

let union_size = Hashtbl.create 1007

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

let compile_gauche e =
match e.node with
|Eident id -> [Inline (id.node^" <= ")]
|_ -> [Inline ("VG"^" <= ")]

let rec compile_expr e =
match e.node with
|Econst c -> 
  begin
    match c with
    |Cint i -> [Inline (Int32.to_string i)]
    |Cstring s ->[Inline ("\""^s^"\"")]
  end
|Eassign (e1,e2) ->
  let r2 = compile_expr e2
  in
  let r1 = compile_gauche e1
  in
  r1@r2
|Eunop (op,expr) ->
  begin
    match op with
      |Upre_inc 
      |Upost_inc
      |Upre_dec
      |Upost_dec
      |_ -> [Inline " \n operateur unaire pas encore gere \n "]
  end
|_ ->[ Inline "Expression pas encore faite\n "]
 
let compile_stmt i =
match i.node with
|Sskip -> []
|Sexpr e ->compile_expr e
|Sreturn r ->
  begin
    match r with
    | Some s -> [Inline " return qlq chose\n "]
    | None -> [Inline " ne retourne rien\n"]
  end
|_ -> [Inline "Instruction pas encore faite\n"]


(* vd signfi variable declaration *)
let recup_data vd = let ty = fst vd in
		    let id = snd vd in
		    let lab = Dlabel id.node in
		    match ty with 
		    |Tint ->[lab;Dword [Int32.zero]]
		    |Tchar ->[lab;Dbyte 1]
		    |Tstruct id|Tunion id ->
		    begin
		      let taille = get_size ty in
		     [lab;Dspace taille]
		    end
		    |Tpointer cy ->[lab;Daddress id.node]


let compile_block  block =   
  let res = List.map (fun v -> recup_data v ) (fst block) 
  in
  let var =List.concat res
  in
  let stm = List.fold_left (fun acc i -> acc ++(mips (compile_stmt i))) nop (snd block)
  in
   stm 




let compile_data prog = function
|Dvars dvl -> 
  let res1 = List.map (fun v -> recup_data v ) dvl in
  let res =List.concat res1
  in {text = prog.text ; data = res}

| Dstruct (id, decls) as d -> Hashtbl.add struct_env id.node decls;prog

| Dunion  (id, decls) as d -> Hashtbl.add union_env  id.node decls;prog 

| Dfun (t,id,dvl,infb) -> 
   let args = List.map (fun v -> recup_data v) dvl 
   in 
   let label = mips [Label id.node] 
   in
   let core = compile_block infb
   in
   let data = prog.data;
   in
   let save = mips [Sw (RA,Areg(0,FP)); Sw (FP,Areg(-4,FP)); Binop (Add,SP,FP,Oimm(-8))] 
   in
   let code = prog.text ++ label ++ save ++  core
   in
   {text = code ; data = data}
  


let compile_file ast = 
  try
    let sortie =List.fold_left (fun acc d -> compile_data acc d) prog  ast 
    in 
    sortie
  with _ ->
    failwith !msg 
