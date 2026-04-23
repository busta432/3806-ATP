(** tptp_lexer.mll — Stub lexer for TPTP FOF format.
    Will be fully implemented in W1-003. *)

{
  open Tptp_parser
}

let whitespace = [' ' '\t']+
let newline = '\r'? '\n'
let ident = ['a'-'z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*
let upper_ident = ['A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule tokenize = parse
  | whitespace  { tokenize lexbuf }
  | newline     { Lexing.new_line lexbuf; tokenize lexbuf }
  | '%' [^ '\n']* { tokenize lexbuf }  (* Line comments *)
  | "fof"       { FOF }
  | "axiom"     { AXIOM }
  | "conjecture" { CONJECTURE }
  | "hypothesis" { HYPOTHESIS }
  | "negated_conjecture" { NEG_CONJECTURE }
  | "![" { FORALL_BRACKET }
  | "?[" { EXISTS_BRACKET }
  | "]:" { BRACKET_COLON }
  | '('  { LPAREN }
  | ')'  { RPAREN }
  | ','  { COMMA }
  | '.'  { DOT }
  | '~'  { TILDE }
  | '&'  { AMP }
  | '|'  { PIPE }
  | "=>" { ARROW }
  | "<=>" { DARROW }
  | upper_ident as s { UPPER_WORD s }
  | ident as s { LOWER_WORD s }
  | eof  { EOF }
  | _ as c { failwith (Printf.sprintf "TPTP lexer: unexpected '%c'" c) }
