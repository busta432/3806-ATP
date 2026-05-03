(** test_improved.ml — Tests for the Improved Prover (Engine 2). *)

open Atp_ocaml.Types
open Atp_ocaml.Improved

let parse_formula s =
  let lexbuf = Lexing.from_string s in
  Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf

let check_prove msg s expected =
  let f = parse_formula s in
  let result = prove f 5000. in (* 5 second timeout *)
  Alcotest.(check bool) msg expected result.solved;
  if result.solved then
    Printf.printf "  [DONE] %s solved in %d steps, %.2f ms\n"
      msg result.stats.steps result.stats.time_ms

(* ================================================================ *)
(* PELLETIER'S PROBLEMS (P1-P20, P43)                                *)
(* ================================================================ *)

let test_pelletier_prop () =
  check_prove "P1" {|P -> Q <-> (~Q -> ~P)|} true;
  check_prove "P2" {|~~P <-> P|} true;
  check_prove "P3" {|~(P -> Q) -> (Q -> P)|} true;
  check_prove "P4" {|~P -> Q <-> ~Q -> P|} true;
  check_prove "P5" {|(P \/ Q -> P \/ R) -> P \/ (Q -> R)|} true;
  check_prove "P6" {|P \/ ~P|} true;
  check_prove "P7" {|P \/ ~~~P|} true;
  check_prove "P8" {|((P -> Q) -> P) -> P|} true; (* Peirce's Law *)
  check_prove "P9" {|(P \/ Q) /\ (~P \/ Q) /\ (P \/ ~Q) -> ~(~P \/ ~Q)|} true;
  check_prove "P10" {|(Q -> R) /\ (S -> ~(P \/ R)) /\ (P \/ Q) -> (S -> Q)|} true

let test_pelletier_fol () =
  (* Monadic Predicate Problems *)
  check_prove "P18" {|exists y. forall x. P(y) -> P(x)|} true;
  check_prove "P19" {|exists x. forall y. forall z. (P(y) -> Q(z)) -> (P(x) -> Q(x))|} true;
  check_prove "P20" {|(forall x. forall y. exists z. forall w. (P(x) /\ Q(y) -> R(z) /\ S(w))) -> (exists x. exists y. P(x) /\ Q(y)) -> (exists z. R(z))|} true;
  
  (* Andrews' Challenge (P34) *)
  check_prove "P34" {|((exists x. forall y. P(x) <-> P(y)) <-> ((exists x. Q(x)) <-> (forall y. Q(y)))) <-> ((exists x. forall y. Q(x) <-> Q(y)) <-> ((exists x. P(x)) <-> (forall y. P(y))))|} true;
  
  (* Pelletier P43 (Monadic logic problem) *)
  check_prove "P43" {|(forall x. forall y. Q(x,y) <-> (forall z. P(z,x) <-> P(z,y))) -> (forall x. forall y. Q(x,y) <-> Q(y,x))|} true

(* ================================================================ *)
(* CORE FOL TESTS                                                   *)
(* ================================================================ *)

let test_fol_core () =
  check_prove "syllogism" {|(forall x. M(x) -> P(x)) /\ M(s) -> P(s)|} true;
  check_prove "drinker" {|exists x. P(x) -> forall y. P(y)|} true;
  check_prove "distrib" {|(forall x. P(x) /\ Q(x)) <-> (forall x. P(x)) /\ (forall x. Q(x))|} true;
  check_prove "exists_and" {|(exists x. P(x) \/ Q(x)) <-> (exists x. P(x)) \/ (exists x. Q(x))|} true

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Improved Engine" [
    "pelletier_prop", [
      Alcotest.test_case "P1-P10" `Quick test_pelletier_prop;
    ];
    "pelletier_fol", [
      Alcotest.test_case "P18-P43" `Quick test_pelletier_fol;
    ];
    "fol_core", [
      Alcotest.test_case "basic" `Quick test_fol_core;
    ];
  ]
