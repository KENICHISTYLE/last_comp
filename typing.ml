open Ast
open Format

(** [print_type fmt typ] pretty-print le type [typ] dans le buffer
    formatté [fmt].
*)

let rec print_type fmt typ =
  match typ with
  | Tnull -> fprintf fmt "%s" "(null)"
  | Tvoid -> fprintf fmt "%s" "void"
  | Tint -> fprintf fmt "%s" "int"
  | Tchar -> fprintf fmt "%s" "char"
  | Tstruct id -> fprintf fmt "struct %s" id.node
  | Tunion id -> fprintf fmt "union %s" id.node
  | Tpointer ty -> fprintf fmt "%a*" print_type ty

(** [type_to_string typ] pretty-print le type [typ] en une
    chaine de caractères
*)

let binop_to_string op =
  match op with
  | Beq -> "=="
  | Bneq -> "!="
  | Blt -> "<"
  | Ble -> "<="
  | Bgt -> ">"
  | Bge -> ">="
  | Badd -> "+"
  | Bsub -> "-"
  | Bmul -> "*"
  | Bdiv -> "/"
  | Bmod -> "%"
  | Band -> "&&"
  | Bor -> "||"


let type_to_string typ =
  fprintf str_formatter "%a" print_type typ;
  flush_str_formatter ()

(** Erreur générique *)
exception Error of loc * string

let error loc msg = raise (Error(loc, msg))

(** Erreur de conflit de type. Assez courante donc définie dans une
    fonction
*)
let type_mismatch loc t1 t2 =
  fprintf str_formatter "expression has type %a but should have type %a"
    print_type t1 print_type t2;
  error loc (flush_str_formatter ())

(** Environnement qui contient les définitions de structures.
    Exporté dans le .mli
*)
let struct_env = Hashtbl.create 97

(** Environnement qui contient les définitions d'unions.
    Exporté dans le .mli
*)
let union_env = Hashtbl.create 97


(** [field_type id def kind name] renvoie le type du champs [id] dans
    la définition de structure ou d'union [def] (qui est une liste de
    paires (types, nom_de_champ)). [kind] est la chaine de caractère
    "struct" ou "union" et [name] est le nom de cette structure ou
    union ([kind] et [name] sont utilisés uniquement pour le message
    d'erreur)
*)

let field_type id def kind name =
  try
    fst (List.find (fun (_, id') -> id'.node = id.node) def)
  with
    Not_found -> error id.loc ("undefined field " ^ id.node ^ " for " ^ kind ^ " type " ^ name)

(** [get_field typ id] renvoie le type du champ [id] du type [typ].
    Lève une erreur si [typ] n'est ni un struct ni une union
*)

let get_field typ id =
  let kind, name =
    match typ with
    | Tstruct name -> "struct", name
    | Tunion name -> "union", name
    | _ -> error id.loc ("field access on a non struct or non union type " ^ (type_to_string typ))
  in
  let def =
    try Hashtbl.find union_env name.node with
      Not_found -> Hashtbl.find struct_env name.node
  in
  field_type id def kind name.node

(** [defined_type id] renvoie vrai ssi une structure ou une union
    appelée [id] est définie *)

let defined_type id =
  (Hashtbl.mem struct_env id.node)
  || (Hashtbl.mem union_env id.node)


(** Environnement qui contient les définitions de fonctions.
    Exporté dans le .mli
*)
let fun_env = Hashtbl.create 97

(** Environnement qui contient les définitions de variables globales.
    Exporté dans le .mli
*)
let glob_env = Hashtbl.create 97

(** position 'dummy' que l'on utilise lorsque l'on crée
    artificiellement des noeuds qui n'existent pas dans l'ast *)
let dummy_loc = Lexing.dummy_pos, Lexing.dummy_pos

(** [check_type below loc name typ] prend un ident [name] et
    Ast.c_type [typ] et vérifie que le type [typ] apparaissant sous la
    définition du nom [name] est bien formée.  L'argument optionnel
    [below] vaut vrai si on est sous un pointeur, faux sinon.
    L'argument optionnel [loc] est une location utilisée en cas
    d'erreur.
*)

let rec check_type ?(below=false) ?(loc=dummy_loc) name typ =
  match typ with
  | Tpointer (typ') -> check_type ~below:true name typ'
  | Tstruct id | Tunion id when not (defined_type id) ->
      if id.node = name.node then
        (if not below then error loc ("Cyclic definition of type " ^ name.node))
      else error id.loc ("Undefined type " ^ id.node)
  | _ -> ()


(** [subtype t1 t2] renvoie vrai si t1 est un sous-type de t2 *)
let rec subtype t1 t2 =
  match t1, t2 with
  | Tvoid, Tvoid
  | (Tchar|Tint), (Tchar|Tint)
  | Tnull, (Tnull| Tpointer _ | Tchar | Tint )
  | Tpointer Tvoid, Tpointer _ -> true

  | Tstruct s1, Tstruct s2
  | Tunion s1, Tunion s2 -> s1.node = s2.node
  | Tpointer t1', Tpointer t2' -> subtype t1' t2'
  | _ -> false

(** [compatible t1 t2] renvoie vrai si les deux types sont compatibles
    i.e. si t1 ≡ t2
*)
let compatible t1 t2 = subtype t1 t2 || subtype t2 t1

(** [is_num t] renvoie vrai ssi [t] est un type numérique
*)
let is_num t =
  match t with
  | Tstruct _ | Tunion _ | Tvoid -> false
  | _ -> true

(** [is_pointer t] renvoie vrai ssi [t] est un pointeur
*)
let is_pointer t =
  match t with
  | Tpointer _ -> true
  | _ -> false

let deref_type t =
  match t with
  | Tpointer tt -> tt
  | _ -> assert false

(** Pour les environnements locaux *)
module Ident = struct
  type t = Ast.ident
  let compare i1 i2 = String.compare i1.node i2.node
end
module Env = Map.Make(Ident)

module StrSet = Set.Make(String)

(** [mk_dummy n] crée un noeud d'AST fictif *)
let mk_dummy n = { loc = dummy_loc; node = n }

let dummy_name = mk_dummy "%%DUMMY_NAME%%"

(** [check_non_void id typ] fonction utilitaire qui vérifie qu'un
    identifiant n'a pas le type void *)

let check_non_void id typ =
  match typ with
    Tvoid -> error id.loc ("identifier '" ^ id.node ^ "' cannot have type void");
  | _ -> ()

(** [node e t] fonction utilitaire qui annote la valeur [e] avec
    l'information [t] *)
let node e t = { node = e; loc = t }

(** [is_lvalue e] fonction utilitaire qui teste si une expression est
    une valeur gauche
*)

let rec is_lvalue e =
  match e.node with
  | Eident _ | Eunop(Ustar, _ )-> true
  | Edot(e, _) -> is_lvalue e
  | _ -> false

(** [type_expr env e] Implémente le typage des expressions. Étant
    donné une expression [e] annotée par des informations de location,
    renvoie une expression [e'] annotée par son type. Leve une
    exception en cas d'erreur de typage.
*)

let rec type_expr env e =
  match e.node with
  | Enull -> node Enull Tnull
  | Econst (Cint i) -> node (Econst (Cint i)) Tint
  | Econst (Cstring s) -> node (Econst (Cstring s))  (Tpointer Tchar)

  | Esizeof typ ->
      (* Règle sizeof: *)
      (* - vérifier que le typ n'est pas void *)
      if compatible typ Tvoid then error e.loc "undefined size for type void";
      (* - vérifier que le type est bien formé *)
      check_type dummy_name typ;
      node (Esizeof typ) Tint

  | Eunop (op, e0) ->

      let et0 = type_expr env e0 in
      let out_type =
        match op with
          Upre_inc | Upost_inc
        | Upre_dec | Upost_dec ->
            if is_lvalue e0
            then if is_num et0.loc then et0.loc
              else
                error e0.loc "invalid type for unary operator"
            else
              error e0.loc "lvalue required for unary operator";
        | Uminus | Uplus | Unot ->
            if is_num et0.loc then et0.loc
            else
              error e0.loc "invalid type for unary operator"
        | Ustar ->
            if is_pointer et0.loc then deref_type et0.loc
	    else
              error e0.loc (sprintf "cannot dereference a non pointer type %s" (type_to_string et0.loc))
        | Uamp ->
            if is_lvalue et0 then (Tpointer et0.loc)
            else
              error e0.loc "operator & requires an lvalue argument"
      in
      node (Eunop(op, et0)) out_type

  | Eassign (e1, e2) ->
      let et1 = type_expr env e1 in
      if not (is_lvalue et1) then error e1.loc "lvalue required for left operand of assignment"
      else
        let et2 = type_expr env e2 in
        if compatible et1.loc et2.loc then node (Eassign(et1, et2))  et1.loc
        else
          type_mismatch e.loc et1.loc et2.loc

  | Ebinop (op, e1, e2) ->
      let et1 = type_expr env e1 in
      let et2 = type_expr env e2 in
      let t1 = et1.loc and t2 = et2.loc in
      begin
	match op with
	| Badd | Bsub when compatible t1 Tint && compatible t2 Tint ->
            node (Ebinop(op, et1, et2)) Tint
        | Badd | Bsub when is_pointer t1 && compatible t2 Tint ->
            node (Ebinop(op, et1, et2)) t1
        | Badd when compatible t1 Tint && is_pointer t2 ->
            node (Ebinop(op, et1, et2)) t2
        | Bsub when is_pointer t1 && is_pointer t2 ->
            node (Ebinop(op, et1, et2)) Tint
	| _  when is_num t1 && is_num t2 -> node (Ebinop(op, et1, et2)) Tint
	| _  -> error e.loc ("incompatible type for binary operator '" ^ binop_to_string op ^"'")
      end

  | Ecall (f, args) ->
      let ret_typ, param_lst =
	try Hashtbl.find fun_env f.node
	with Not_found -> error f.loc ("undefined function " ^ f.node)
      in
      begin
	try
	  let args0 = List.map2
	    (fun e0 (tx, _) ->
	      let et0 = type_expr env e0 in
	      if compatible et0.loc tx then et0 else type_mismatch e0.loc tx et0.loc) args param_lst
	  in
	  node (Ecall(f, args0)) ret_typ
	with
	  Invalid_argument _ ->
	    error e.loc (sprintf "function %s expects %i arguments but was called with %i"
			    f.node (List.length param_lst) (List.length args))
	| e -> raise e
      end

  | Eident id ->
      let tid =
	try
	  Env.find id env
	with
	  Not_found ->
	    try
              (* Si on ne l'a pas trouvé on le cherche dans l'environnement global *)
	      Hashtbl.find glob_env id.node
	    with
	      Not_found ->
		error id.loc ("Undefined variable " ^ id.node)
      in
      node (Eident id) tid

  | Edot (e0, id) ->
      let et0 = type_expr env e0 in
      node (Edot(et0, id)) (get_field et0.loc id)


(** [type_decl env e] Implémente le typage des déclarations de variables.
*)

let type_decl env decls =
  let renv = ref env in
  let declared = ref StrSet.empty in
  let ndecls =
    List.map (fun (typ, id) ->
      check_type dummy_name typ;  (* Vérifie que le type est bien formé *)
      check_non_void id typ;      (* Vérifie que le type n'est pas void *)
      if StrSet.mem id.node !declared  (* Vérifie qu'une variable n'apparait pas 2 fois dans un bloc *)
      then error id.loc ("redefinition of '" ^ id.node ^"'")
      else declared := StrSet.add id.node !declared;
      renv := Env.add id typ !renv;
      (typ, id)
    ) decls
  in
  ndecls, !renv

(** [type_instr env ret i] type l'instruction [i], dans l'environnement [env],
    L'instruction [i] est dans la définition d'une fonction dont le type de
    retour est [ret]
*)

let rec type_instr env ret i =
  match i.node with
  | Sskip -> node Sskip Tvoid
  | Sexpr e0 -> let et0 = type_expr env e0 in
		node (Sexpr et0) et0.loc

  | Sif (c0, i1, i2) ->
      let ct0 = type_expr env c0 in
      if compatible ct0.loc Tint then node (Sif (ct0,
						  type_instr env ret i1,
						  type_instr env ret i2)) Tvoid
      else
	type_mismatch c0.loc ct0.loc Tint

  | Swhile(c0, i1) ->
      let ct0 = type_expr env c0 in
      if compatible ct0.loc Tint then node (Swhile (ct0, type_instr env ret i1)) Tvoid
      else
	type_mismatch c0.loc ct0.loc Tint

  | Sfor(sl1, c0, sl2, b) ->
      let _, nsl1 = type_block env ret [] sl1 in
      let ct0 = type_expr env c0 in
      if not (compatible ct0.loc Tint) then type_mismatch c0.loc ct0.loc Tint;
      let _, nsl2 = type_block env ret [] sl2 in
      let b0 = type_instr env ret b in
      node (Sfor(nsl1, ct0, nsl2, b0)) Tvoid

  | Sblock (il, sl) ->
      let il0, sl0 = type_block env ret il sl in
      node (Sblock (il0, sl0)) Tvoid

  | Sreturn None ->
      if compatible ret Tvoid then node (Sreturn None) Tvoid
      else error i.loc "empty return in non-void function"

  | Sreturn (Some e0) ->
      let et0 = type_expr env e0 in
      if compatible et0.loc ret then node (Sreturn (Some et0)) Tvoid
      else
	type_mismatch e0.loc et0.loc ret
(** [type_block env ret il sl] type dans l'environnement [env] et
    avec l'hypothèse d'un type de retour [ret] la liste de déclarations
    [il] et la liste d'instructions [sl]
*)
and type_block env ret il sl =
  let il0, env0 = type_decl env il in
  let sl0 = List.map (type_instr env0 ret) sl in
  il0, sl0

let fail_if_present h kind id =
  if Hashtbl.mem h id.node then
    error id.loc ("redefinition of " ^ kind ^ "'" ^ id.node ^"'")

(** [enter_def h kind name decls] fonction auxiliaire qui rajoute la
    définition du type [name] (qui est une struct ou une union)
    la hashtable [h] *)

let enter_def h kind name decls =
  fail_if_present h kind name;
  let declared = ref StrSet.empty in
  List.iter (fun (ty, id) ->
    if StrSet.mem id.node !declared then
      error id.loc ("redefinition of field '" ^ id.node ^"' in " ^ kind);
    declared := StrSet.add id.node !declared;
    check_type ~loc:id.loc name ty;
    check_non_void id ty;
  ) decls;
  Hashtbl.add h name.node decls

(** [enter_fun ret f params] rajoute la fonction [f] dans la table
    de hash [fun_env] (avec son type de retour et la liste de ses
    paramètres)
*)

let enter_fun ret f params =
  fail_if_present fun_env "function" f;
  let _, env = type_decl Env.empty params in
  Hashtbl.add fun_env f.node (ret, params);
  env

(** [built_in] variable globale contenant les fonctions prédéfinies *)

let built_in = [
  Tint, mk_dummy "putchar",  [ Tint, dummy_name ];
  Tpointer Tvoid, mk_dummy "sbrk", [ Tint, dummy_name ];
]

(** [has_main] référence booléen que l'on met a [true] lorsque l'on a
    rencontré la fonction main
*)

let has_main = ref false

(** [type_def d] typage d'une déclaration *)

let type_def d =
  match d with
  | Dvars il ->
      let il0, env = type_decl Env.empty il in
      Env.iter
        (fun id ty ->
          if Hashtbl.mem glob_env id.node then
          error id.loc ("multiple definition of identifier " ^ id.node);
          Hashtbl.add glob_env id.node ty) env;
      Dvars il0
  | Dstruct (id, decls) as d'-> enter_def struct_env "structure" id decls; d'
  | Dunion (id, decls) as d' -> enter_def union_env "union" id decls; d'
  | Dfun (ret, f, params, (il, sl))  ->
      if f.node = "main" && compatible ret Tint && params = [] then has_main := true;
      let env = enter_fun ret f params in
      Dfun (ret, f, params, type_block env ret il sl)


(** [file l] typage de l'ast [l] *)
let file l =
  (* initialisation des environnements *)
  Hashtbl.clear struct_env;
  Hashtbl.clear union_env;
  Hashtbl.clear glob_env;
  Hashtbl.clear fun_env;
  (* Ajout des fonctions prédéinies dans l'environnemnet [fun_env] *)
  List.iter (fun (r, f, p) -> ignore (enter_fun r f p)) built_in;
  (* typage de chaque déclaration *)
  let tl = List.map type_def l in
  (* si on n'a pas trouvé main avec le bon type, on échoue *)
  if not !has_main then error dummy_loc "missing 'int main()' function"
  else tl
