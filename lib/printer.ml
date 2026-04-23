(** printer.ml — Pretty-printing for all ATP data types.
    
    Provides human-readable string representations for terms,
    formulae, sequents, clauses, and proof trees. Used for
    debugging, test output, and proof display. *)

open Types

(* ================================================================ *)
(* TERMS                                                             *)
(* ================================================================ *)

(** Pretty-print a term. Constants (zero-arity functions) are printed
    without parentheses. *)
let rec pp_term = function
  | Var x -> x
  | Func (f, []) -> f
  | Func (f, args) ->
    f ^ "(" ^ String.concat ", " (List.map pp_term args) ^ ")"

(* ================================================================ *)
(* FORMULAE                                                          *)
(* ================================================================ *)

(** Precedence levels for minimal parenthesization.
    Higher number = tighter binding. *)
let prec = function
  | Top | Bot | Pred _ -> 100
  | Not _              -> 90
  | And _              -> 70
  | Or _               -> 60
  | Implies _          -> 50
  | Iff _              -> 40
  | Forall _ | Exists _ -> 30

(** Pretty-print a formula with minimal parentheses. *)
let rec pp_formula f =
  match f with
  | Top -> "⊤"
  | Bot -> "⊥"
  | Pred (p, []) -> p
  | Pred (p, args) ->
    p ^ "(" ^ String.concat ", " (List.map pp_term args) ^ ")"
  | Not a ->
    "¬" ^ pp_wrap a f
  | And (a, b) ->
    pp_wrap a f ^ " ∧ " ^ pp_wrap b f
  | Or (a, b) ->
    pp_wrap a f ^ " ∨ " ^ pp_wrap b f
  | Implies (a, b) ->
    pp_wrap a f ^ " → " ^ pp_wrap_right b f
  | Iff (a, b) ->
    pp_wrap a f ^ " ↔ " ^ pp_wrap b f
  | Forall (x, a) ->
    "∀" ^ x ^ ". " ^ pp_formula a
  | Exists (x, a) ->
    "∃" ^ x ^ ". " ^ pp_formula a

(** Wrap sub-formula in parens if its precedence is lower than parent. *)
and pp_wrap sub parent =
  if prec sub < prec parent then "(" ^ pp_formula sub ^ ")"
  else pp_formula sub

(** Wrap right-associative operand (used for → to avoid a → (b → c) parens). *)
and pp_wrap_right sub parent =
  if prec sub <= prec parent then
    match sub with
    | Implies _ -> pp_formula sub
    | Forall _ | Exists _ -> pp_formula sub
    | _ -> "(" ^ pp_formula sub ^ ")"
  else pp_formula sub

(** ASCII-only pretty-print (for file output and TPTP compatibility). *)
let rec pp_formula_ascii f =
  match f with
  | Top -> "true"
  | Bot -> "false"
  | Pred (p, []) -> p
  | Pred (p, args) ->
    p ^ "(" ^ String.concat ", " (List.map pp_term args) ^ ")"
  | Not a -> "~" ^ pp_wrap_ascii a f
  | And (a, b) -> pp_wrap_ascii a f ^ " /\\ " ^ pp_wrap_ascii b f
  | Or (a, b) -> pp_wrap_ascii a f ^ " \\/ " ^ pp_wrap_ascii b f
  | Implies (a, b) -> pp_wrap_ascii a f ^ " => " ^ pp_wrap_right_ascii b f
  | Iff (a, b) -> pp_wrap_ascii a f ^ " <=> " ^ pp_wrap_ascii b f
  | Forall (x, a) -> "forall " ^ x ^ ". " ^ pp_formula_ascii a
  | Exists (x, a) -> "exists " ^ x ^ ". " ^ pp_formula_ascii a

and pp_wrap_ascii sub parent =
  if prec sub < prec parent then "(" ^ pp_formula_ascii sub ^ ")"
  else pp_formula_ascii sub

and pp_wrap_right_ascii sub parent =
  if prec sub <= prec parent then
    match sub with
    | Implies _ -> pp_formula_ascii sub
    | Forall _ | Exists _ -> pp_formula_ascii sub
    | _ -> "(" ^ pp_formula_ascii sub ^ ")"
  else pp_formula_ascii sub

(* ================================================================ *)
(* SEQUENTS                                                          *)
(* ================================================================ *)

(** Pretty-print a sequent: Γ ⊢ Δ *)
let pp_sequent { antecedent; succedent } =
  let left = String.concat ", " (List.map pp_formula antecedent) in
  let right = String.concat ", " (List.map pp_formula succedent) in
  left ^ " ⊢ " ^ right

(* ================================================================ *)
(* LITERALS & CLAUSES                                                *)
(* ================================================================ *)

(** Pretty-print a literal. *)
let pp_literal = function
  | Pos (p, []) -> p
  | Pos (p, args) -> p ^ "(" ^ String.concat ", " (List.map pp_term args) ^ ")"
  | Neg (p, []) -> "¬" ^ p
  | Neg (p, args) -> "¬" ^ p ^ "(" ^ String.concat ", " (List.map pp_term args) ^ ")"

(** Pretty-print a clause as a disjunction of literals. *)
let pp_clause c =
  if c = [] then "□"  (* empty clause *)
  else String.concat " ∨ " (List.map pp_literal c)

(* ================================================================ *)
(* RULES                                                             *)
(* ================================================================ *)

(** Pretty-print an LK' rule name. *)
let pp_rule = function
  | Identity -> "id"
  | TopRight -> "⊤R"
  | BotLeft -> "⊥L"
  | AndLeft i -> Printf.sprintf "∧L(%d)" i
  | AndRight i -> Printf.sprintf "∧R(%d)" i
  | OrLeft i -> Printf.sprintf "∨L(%d)" i
  | OrRight i -> Printf.sprintf "∨R(%d)" i
  | ImpliesLeft i -> Printf.sprintf "→L(%d)" i
  | ImpliesRight i -> Printf.sprintf "→R(%d)" i
  | NotLeft i -> Printf.sprintf "¬L(%d)" i
  | NotRight i -> Printf.sprintf "¬R(%d)" i
  | IffLeft i -> Printf.sprintf "↔L(%d)" i
  | IffRight i -> Printf.sprintf "↔R(%d)" i
  | ForallLeft (i, t) -> Printf.sprintf "∀L(%d, %s)" i (pp_term t)
  | ForallRight (i, y) -> Printf.sprintf "∀R(%d, %s)" i y
  | ExistsLeft (i, y) -> Printf.sprintf "∃L(%d, %s)" i y
  | ExistsRight (i, t) -> Printf.sprintf "∃R(%d, %s)" i (pp_term t)

(* ================================================================ *)
(* PROOF TREES                                                       *)
(* ================================================================ *)

(** Pretty-print a proof tree with indentation. *)
let rec pp_proof_tree indent tree =
  let pad = String.make indent ' ' in
  match tree with
  | Axiom (r, seq) ->
    Printf.sprintf "%s[%s] %s" pad (pp_rule r) (pp_sequent seq)
  | Inference (r, seq, children) ->
    let header = Printf.sprintf "%s[%s] %s" pad (pp_rule r) (pp_sequent seq) in
    let child_strs = List.map (pp_proof_tree (indent + 2)) children in
    String.concat "\n" (header :: child_strs)

(* ================================================================ *)
(* STATISTICS                                                        *)
(* ================================================================ *)

(** Pretty-print prover statistics. *)
let pp_stats s =
  Printf.sprintf
    "Steps: %d | Branches: %d | Depth: %d | Time: %.1fms\n\
     Inst: attempts=%d hits=%d wasted=%d\n\
     Resolution: clauses=%d subsumptions=%d"
    s.steps s.branches s.max_depth s.time_ms
    s.inst_attempts s.inst_hits s.inst_wasted
    s.clauses_gen s.subsumptions

(** Pretty-print engine name. *)
let pp_engine = function
  | Baseline -> "Baseline (Algorithm 2)"
  | Improved -> "Improved LK'"
  | Resolution -> "Resolution Refutation"
