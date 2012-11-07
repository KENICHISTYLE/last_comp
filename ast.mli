(* Arbres de syntaxe abstraite pour le typage *)

type ('info, 'node) node = { loc : 'info;
			     node : 'node }

type loc = Lexing.position * Lexing.position

type ident = (loc, string) node

type c_type =
  | Tnull (* pour typer null *)
  | Tvoid
  | Tint
  | Tchar
  | Tstruct of ident
  | Tunion of ident
  | Tpointer of c_type

type constant =
  | Cint of int32
  | Cstring of string

type unop =
  | Upre_inc | Upost_inc | Upre_dec | Upost_dec
  | Ustar | Uamp | Unot | Uminus | Uplus


type binop =
  | Beq | Bneq | Blt | Ble | Bgt | Bge | Badd | Bsub | Bmul | Bdiv
  | Bmod | Band | Bor

type 'info expr = ('info, 'info expr_node) node
and 'info expr_node =
  | Enull (* Insérée automatiquement à partir de 0 *)
  | Econst of constant
  | Eident of ident
  | Esizeof of c_type
  | Edot of  'info expr * ident
  | Eassign of 'info expr * 'info expr
  | Eunop of unop * 'info expr
  | Ebinop of binop * 'info expr * 'info expr
  | Ecall of ident * 'info expr list

type var_decl =  c_type * ident

type 'info init =
  | InitExpr of 'info expr
  | InitList of 'info init list


type 'info statement = ('info, 'info statement_node) node
and 'info statement_node =
  | Sskip
  | Sexpr of 'info expr
  | Sif of 'info expr * 'info statement * 'info statement
  | Swhile of  'info expr * 'info statement
  | Sfor of 'info statement list
    *  'info expr
    * 'info statement list
    * 'info statement
  | Sblock of 'info block
  | Sreturn of 'info expr option

and 'info block =
    var_decl list * 'info statement list

type 'info decl =
  | Dvars of var_decl list
  | Dstruct of ident * var_decl list
  | Dunion of  ident * var_decl list
  | Dfun of c_type * ident * var_decl list * 'info block

type 'info file =  'info decl list
