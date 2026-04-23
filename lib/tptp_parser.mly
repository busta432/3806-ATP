(** tptp_parser.mly — Stub parser for TPTP FOF format.
    Parses: fof(name, role, formula).
    Will be fully implemented in W1-003. *)

%{
  open Types
%}

%token <string> LOWER_WORD
%token <string> UPPER_WORD
%token FOF AXIOM CONJECTURE HYPOTHESIS NEG_CONJECTURE
%token FORALL_BRACKET EXISTS_BRACKET BRACKET_COLON
%token LPAREN RPAREN COMMA DOT
%token TILDE AMP PIPE ARROW DARROW
%token EOF

%right DARROW
%right ARROW
%left PIPE
%left AMP
%nonassoc TILDE

%start <(string * string * Types.formula) list> tptp_file

%%

tptp_file:
  | decls = list(fof_decl); EOF { decls }

fof_decl:
  | FOF; LPAREN; name = LOWER_WORD; COMMA; role = role; COMMA;
    f = tptp_formula; RPAREN; DOT
    { (name, role, f) }

role:
  | AXIOM           { "axiom" }
  | CONJECTURE      { "conjecture" }
  | HYPOTHESIS      { "hypothesis" }
  | NEG_CONJECTURE  { "negated_conjecture" }
  | r = LOWER_WORD  { r }  (* fallback for other roles *)

tptp_formula:
  | TILDE; f = tptp_formula              { Not f }
  | f1 = tptp_formula; AMP; f2 = tptp_formula   { And (f1, f2) }
  | f1 = tptp_formula; PIPE; f2 = tptp_formula  { Or (f1, f2) }
  | f1 = tptp_formula; ARROW; f2 = tptp_formula { Implies (f1, f2) }
  | f1 = tptp_formula; DARROW; f2 = tptp_formula { Iff (f1, f2) }
  | FORALL_BRACKET; vars = separated_nonempty_list(COMMA, UPPER_WORD);
    BRACKET_COLON; f = tptp_formula
    { List.fold_right (fun v acc -> Forall (v, acc)) vars f }
  | EXISTS_BRACKET; vars = separated_nonempty_list(COMMA, UPPER_WORD);
    BRACKET_COLON; f = tptp_formula
    { List.fold_right (fun v acc -> Exists (v, acc)) vars f }
  | a = tptp_atomic                       { a }
  | LPAREN; f = tptp_formula; RPAREN     { f }

tptp_atomic:
  | p = LOWER_WORD  { Pred (p, []) }
  | p = LOWER_WORD; LPAREN; args = tptp_term_list; RPAREN { Pred (p, args) }

tptp_term:
  | x = UPPER_WORD  { Var x }     (* TPTP convention: uppercase = variable *)
  | f = LOWER_WORD  { Func (f, []) }
  | f = LOWER_WORD; LPAREN; args = tptp_term_list; RPAREN { Func (f, args) }

tptp_term_list:
  | ts = separated_nonempty_list(COMMA, tptp_term) { ts }
