open Ast

let var_env = Hashtbl.create 1007

module Env = Map.Make(String)

let var_nb = ref 0
let rename_var id =
  incr(var_nb);{loc = id.loc ;node = id.node^string_of_int(!var_nb)}

let rec rename_expr env e =
  let node =
    match e.node with
      |Eident id ->
	begin
	  try 
	    let nid = Env.find id.node env
	    in 
	    Eident {loc = id.loc; node = nid }
	  with Not_found ->
	    let nid = Hashtbl.find var_env id.node
	    in 
	    Eident {loc = id.loc ; node = nid }
	end

      |Edot (e,id) ->
	let ne = rename_expr env e in
	Edot (ne,id)

      
      |Eassign (e1,e2) ->
	let ne1 = rename_expr env e1 in
	let ne2 = rename_expr env e2 in
	Eassign (ne1,ne2)
	  
      |Eunop (op,e) ->
	let ne = rename_expr env e in
	  Eunop (op,ne)
	  
      |Ebinop (op,e1,e2) ->
	let ne1 = rename_expr env e1 in
	let ne2 = rename_expr env e2 in
	Ebinop (op,ne1,ne2)
      
      |Ecall (id,el) ->
	let nel = List.map (rename_expr env) el in
	Ecall (id,nel)
	  
      |_ as e -> e
  in
  {loc = e.loc ; node = node}

let rec rename_stmt env s =
  let node =
    match s.node with
      |Sexpr e ->
	let ne = rename_expr env e in
	Sexpr ne 

      |Sif (e,s1,s2) ->
	let ne = rename_expr env e in
	let ns1 = rename_stmt env s1 in
	let ns2 = rename_stmt env s2 in
	Sif (ne,ns1,ns2)

      |Swhile (e,s) ->
	let ne = rename_expr env e in
	let ns = rename_stmt env s in
	Swhile (ne,ns)

      |Sfor (sl1,e,sl2,s) ->
	let ne = rename_expr env e in
	let nsl1 =List.map (rename_stmt env) sl1 in
	let nsl2 =List.map (rename_stmt env) sl2 in
	let ns = rename_stmt env s in
	Sfor (nsl1,ne,nsl2,ns)

      |Sblock b ->
	let nb = rename_block env b in
	Sblock nb

      |Sreturn e ->
	begin
	  match e with
	    | Some e ->
	      let ne = rename_expr env e in
	      Sreturn (Some ne)		
	    | None -> 
	      Sreturn e 
	end
	  
      |_ as s -> s
  in
  {loc = s.loc ; node = node }
      
and rename_block env (vars,stmts) = 
  let local,vars = (List.fold_left
		      (fun (env,dvl) (t,id) -> 
			let v = rename_var id in
			((Env.add id.node v.node env),((t,v)::dvl))
		      ) 
		      (env,[]) vars)
  in
  let stmts = List.map (rename_stmt local) stmts in
  (vars,stmts)
    

let rename_decl  = function 
  |Dvars dvl ->
   Dvars (List.map 
	    (fun (t,id) -> 
	      let v = rename_var id in
	      Hashtbl.add var_env id.node v.node;
	      (t,v)
	    ) 
	    dvl)
  |Dfun(t, id, dvl, block) ->    
    let local,ndvl = (List.fold_left
	    (fun (env,dvl) (t,id) -> 
	      let v = rename_var id in
	      Env.add id.node v.node env, ((t,v)::dvl)
	    ) 
	    (Env.empty,[]) dvl)
    in
    let nblock = rename_block local block in
    Dfun(t,id,(List.rev ndvl),nblock)
  |_ as d -> d 


let rename_file ast =
  let ast = List.map rename_decl ast in
  ast
