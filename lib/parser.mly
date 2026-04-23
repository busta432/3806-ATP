(** parser.mly — Menhir parser for first-order logic formulae.
    
    Grammar with correct operator precedence:
      NOT  > AND > OR > IMPLIES (right-assoc) > IFF

    Quantifiers bind as tightly as possible:
      forall x. P(x) /\ Q(x) parses as forall x. (P(x) /\ Q(x))
*)

%{
  open Types
%}

(* Tokens *)
%token <string> NAME
%token FORALL EXISTS
%token AND OR NOT IMPLIES IFF
%token TOP BOT
%token LPAREN RPAREN COMMA DOT
%token EOF

(* Precedence: lowest to highest *)
%right IFF
%right IMPLIES
%left OR
%left AND
%nonassoc NOT

%start <Types.formula> formula_eof
%start <Types.formula list> formula_list_eof

%%

formula_eof:
  | f = formula; EOF { f }

formula_list_eof:
  | fs = separated_nonempty_list(DOT, formula); EOF { fs }

formula:
  | TOP                                       { Top }
  | BOT                                       { Bot }
  | NOT; f = formula                          { Not f }
  | f1 = formula; AND; f2 = formula           { And (f1, f2) }
  | f1 = formula; OR; f2 = formula            { Or (f1, f2) }
  | f1 = formula; IMPLIES; f2 = formula       { Implies (f1, f2) }
  | f1 = formula; IFF; f2 = formula           { Iff (f1, f2) }
  | FORALL; x = NAME; DOT; f = formula        { Forall (x, f) }
  | EXISTS; x = NAME; DOT; f = formula        { Exists (x, f) }
  | a = atomic                                { a }
  | LPAREN; f = formula; RPAREN              { f }

atomic:
  | p = NAME                                  { Pred (p, []) }
  | p = NAME; LPAREN; args = term_list; RPAREN  { Pred (p, args) }

term:
  | x = NAME
    { 
      (* Convention: lowercase start = variable, uppercase start = constant *)
      if String.length x > 0 && x.[0] >= 'A' && x.[0] <= 'Z' then Func (x, [])
      else Var x
    }
  | f = NAME; LPAREN; args = term_list; RPAREN  { Func (f, args) }

term_list:
  | ts = separated_nonempty_list(COMMA, term) { ts }
