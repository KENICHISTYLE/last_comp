
val file : Ast.loc Ast.file -> Ast.c_type Ast.file
(** [file l] typage de l'ast [l] *)


val is_lvalue : 'info Ast.expr -> bool
(** [is_lvalue e] fonction utilitaire qui teste si une expression est
    une valeur gauche
*)

val compatible : Ast.c_type -> Ast.c_type -> bool
(** [compatible t1 t2] renvoie vrai si les deux types sont compatibles
    i.e. si t1 ≡ t2
*)

val is_num :  Ast.c_type -> bool
(** [is_num t] renvoie vrai ssi [t] est un type numérique *)

val is_pointer :  Ast.c_type -> bool
(** [is_pointer t] renvoie vrai ssi [t] est un pointeur *)

val struct_env : (string, Ast.var_decl list) Hashtbl.t
(** Environnement qui contient les définitions de structures *)

val union_env : (string, Ast.var_decl list) Hashtbl.t
(** Environnement qui contient les définitions d'unions *)

exception Error of Ast.loc * string

