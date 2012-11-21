
open Ast
open Typing
open Mips
open Ast
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
          if ((acc mod 4) = 0) then
            (acc+4) 
          else 
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
    in
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







let compile_decl d =
match d with
| Dvars dvl ->
  let res = 
    List.map 
      (fun  (t,id) -> 
        (t,rename id))  dvl
  in Dvars res
|_ -> assert false

(* vd signfi variable declaration *)
let recup_data vd = let ty = fst vd in
		    let id = snd vd in
		    match ty with 
		    |Tint ->  Dword [Int32.zero]
		    |Tchar -> Dbyte 1
		    |Tstruct id|Tunion id ->
		    begin
		      let taille = get_size ty in
		      Dspace taille
		    end
		    |Tpointer cy ->Daddress id.node

let recup_data_list = function(*
|Dvars dvl -> 
  let res = List.map (fun (t,id) -> {allign = 4;label = id.node; size = get_size t}) dvl 
  in res
	   
| Dstruct (id, decls) as d -> Hashtbl.add struct_env id.node decls;d

| Dunion  (id, decls) as d -> Hashtbl.add union_env  id.node decls;d 
			      *)
(* |Dfun (t,id,dvl,infb) -> 
  let args = List.map (fun (t,id) -> {allign = 4;label = id.node; size = get_size t}) dvl 
  in 
*)

|_ -> assert false 


let compile_file ast = 
         failwith !msg 
