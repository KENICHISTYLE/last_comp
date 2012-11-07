open Ast
open Typing


let struct_env = Typing.struct_env 

let union_env = Typing.union_env

let struct_size = Hashtbl.create 1007

let union_size = Hashtbl.create 1007

let rec get_struct_size s =
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
        let x = Hashtbl.find  struct_env sid.node in
        get_struct_size x
      |Tunion uid ->
        let x = Hashtbl.find  union_env uid.node in
        get_struct_size x     (* union size *)
      | _ -> 0
    ) 0 s
    
let size_all_struct sl = 
  Hashtbl.iter (fun id dvl -> Hashtbl.add struct_size id (get_struct_size dvl)) sl 

let msg = ref " Rien n'est declarer"

let print =
  Hashtbl.iter 
    (fun id s -> msg := " Struct : "^id ^", size : "^string_of_int(s) ) struct_size

let rename id = 
  let x = ref 0 in
  incr(x);{loc = id.loc ;node = id.node^string_of_int(!x)}

let compile_decl d =
match d with
| Dvars dvl ->
  let res = 
    List.map 
      (fun  (t,id) -> 
        (t,rename id))  dvl
  in Dvars res
| Dstruct (id, decls) as d -> Hashtbl.add struct_env id.node decls;d
| Dunion  (id, decls) as d -> Hashtbl.add union_env  id.node decls;d 
| Dfun _ as d -> d 

let compile_file ast = 
  let _res = List.map compile_decl ast in
  let () = 
    size_all_struct struct_env ;
    print 
  in  failwith !msg 
