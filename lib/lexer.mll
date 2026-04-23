(** lexer.mll — OCamllex lexer for first-order logic formulae.
    
    Tokenizes the custom input format used for development and
    the Pelletier/custom benchmark problems.
    
    Supports both ASCII and Unicode logical connectives. *)

{
  open Parser

  exception Lexer_error of string
}

let whitespace = [' ' '\t']+
let newline = '\r'? '\n'
let lowercase = ['a'-'z']
let uppercase = ['A'-'Z']
let digit = ['0'-'9']
let ident_char = ['a'-'z' 'A'-'Z' '0'-'9' '_']

(* Variables start with lowercase, predicates/functions with uppercase *)
let var_name = lowercase ident_char*
let pred_name = uppercase ident_char*

rule tokenize = parse
  | whitespace  { tokenize lexbuf }
  | newline     { Lexing.new_line lexbuf; tokenize lexbuf }

  (* Logical connectives — ASCII *)
  | "/\\"       { AND }
  | "\\/"       { OR }
  | "~"         { NOT }
  | "->"        { IMPLIES }
  | "=>"        { IMPLIES }
  | "<->"       { IFF }
  | "<=>"       { IFF }

  (* Logical connectives — Unicode *)
  | "\xe2\x88\xa7"  { AND }       (* ∧ = U+2227 *)
  | "\xe2\x88\xa8"  { OR }        (* ∨ = U+2228 *)
  | "\xc2\xac"      { NOT }       (* ¬ = U+00AC *)
  | "\xe2\x86\x92"  { IMPLIES }   (* → = U+2192 *)
  | "\xe2\x86\x94"  { IFF }       (* ↔ = U+2194 *)
  | "\xe2\x88\x80"  { FORALL }    (* ∀ = U+2200 *)
  | "\xe2\x88\x83"  { EXISTS }    (* ∃ = U+2203 *)
  | "\xe2\x8a\xa4"  { TOP }       (* ⊤ = U+22A4 *)
  | "\xe2\x8a\xa5"  { BOT }       (* ⊥ = U+22A5 *)

  (* Quantifiers — keyword form *)
  | "forall"    { FORALL }
  | "exists"    { EXISTS }
  | "true"      { TOP }
  | "false"     { BOT }

  (* Delimiters *)
  | '('         { LPAREN }
  | ')'         { RPAREN }
  | ','         { COMMA }
  | '.'         { DOT }

  (* Identifiers *)
  | ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9' '_']* as s { NAME s }

  (* End of input *)
  | eof         { EOF }

  (* Error *)
  | _ as c      { raise (Lexer_error (Printf.sprintf "Unexpected character '%c' at line %d, column %d"
                    c (Lexing.lexeme_start_p lexbuf).pos_lnum
                    (Lexing.lexeme_start_p lexbuf).pos_cnum)) }
