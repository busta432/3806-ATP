(** test_unification.ml — Tests for the unification algorithm. *)

open Atp_ocaml.Types
open Atp_ocaml.Unification
open Atp_ocaml.Printer

let is_subst _ = true

(* Helper to check unification succeeds and produces expected binding *)
let check_unifies msg t1 t2 =
  match unify_terms_fresh ~use_rank_check:false is_subst t1 t2 with
  | Some sigma ->
    let t1' = apply sigma t1 in
    let t2' = apply sigma t2 in
    Alcotest.(check string) msg (pp_term t1') (pp_term t2')
  | None ->
    Alcotest.fail (Printf.sprintf "%s: expected unification to succeed" msg)

let check_fails msg t1 t2 =
  match unify_terms_fresh ~use_rank_check:false is_subst t1 t2 with
  | Some _ ->
    Alcotest.fail (Printf.sprintf "%s: expected unification to fail" msg)
  | None -> ()

(* ================================================================ *)
(* BASIC UNIFICATION                                                 *)
(* ================================================================ *)

let test_unify_identical () =
  check_unifies "identical vars" (Var "x") (Var "x")

let test_unify_var_const () =
  check_unifies "var-const" (Var "x") (Func ("a", []))

let test_unify_var_func () =
  check_unifies "var-func" (Var "x") (Func ("f", [Var "y"]))

let test_unify_func_func () =
  check_unifies "func-func"
    (Func ("f", [Var "x"; Func ("a", [])]))
    (Func ("f", [Func ("b", []); Var "y"]))

let test_unify_nested () =
  check_unifies "nested"
    (Func ("f", [Var "x"; Func ("g", [Var "y"])]))
    (Func ("f", [Func ("a", []); Func ("g", [Func ("b", [])])]))

(* ================================================================ *)
(* FAILURE CASES                                                     *)
(* ================================================================ *)

let test_fail_different_funcs () =
  check_fails "different functions"
    (Func ("f", [Var "x"]))
    (Func ("g", [Var "x"]))

let test_fail_different_arity () =
  check_fails "different arity"
    (Func ("f", [Var "x"]))
    (Func ("f", [Var "x"; Var "y"]))

let test_fail_occurs_check () =
  (* x cannot unify with f(x) *)
  check_fails "occurs check"
    (Var "x")
    (Func ("f", [Var "x"]))

(* ================================================================ *)
(* LITERAL UNIFICATION                                               *)
(* ================================================================ *)

let test_unify_pos_literals () =
  let l1 = Pos ("P", [Var "x"; Func ("a", [])]) in
  let l2 = Pos ("P", [Func ("b", []); Var "y"]) in
  match unify_literals ~use_rank_check:false is_subst [] l1 l2 with
  | Some sigma ->
    let l1' = apply_literal sigma l1 in
    let l2' = apply_literal sigma l2 in
    Alcotest.(check string) "literals unified"
      (pp_literal l1') (pp_literal l2')
  | None -> Alcotest.fail "expected literal unification to succeed"

let test_unify_complementary () =
  let l1 = Pos ("P", [Var "x"]) in
  let l2 = Neg ("P", [Func ("a", [])]) in
  match unify_complementary ~use_rank_check:false is_subst [] l1 l2 with
  | Some _ -> ()  (* Success *)
  | None -> Alcotest.fail "expected complementary unification to succeed"

let test_fail_complementary_diff_pred () =
  let l1 = Pos ("P", [Var "x"]) in
  let l2 = Neg ("Q", [Func ("a", [])]) in
  match unify_complementary ~use_rank_check:false is_subst [] l1 l2 with
  | Some _ -> Alcotest.fail "expected complementary unification to fail"
  | None -> ()

(* ================================================================ *)
(* SUBSTITUTION UTILITIES                                            *)
(* ================================================================ *)

let test_compose () =
  let s1 = [("x", Var "y")] in
  let s2 = [("y", Func ("a", []))] in
  let composed = compose s1 s2 in
  let result = apply composed (Var "x") in
  Alcotest.(check string) "compose" "a" (pp_term result)

(* ================================================================ *)
(* TEST RUNNER                                                       *)
(* ================================================================ *)

let () =
  Alcotest.run "Unification" [
    "basic", [
      Alcotest.test_case "identical" `Quick test_unify_identical;
      Alcotest.test_case "var-const" `Quick test_unify_var_const;
      Alcotest.test_case "var-func" `Quick test_unify_var_func;
      Alcotest.test_case "func-func" `Quick test_unify_func_func;
      Alcotest.test_case "nested" `Quick test_unify_nested;
    ];
    "failure", [
      Alcotest.test_case "diff functions" `Quick test_fail_different_funcs;
      Alcotest.test_case "diff arity" `Quick test_fail_different_arity;
      Alcotest.test_case "occurs check" `Quick test_fail_occurs_check;
    ];
    "literal", [
      Alcotest.test_case "pos literals" `Quick test_unify_pos_literals;
      Alcotest.test_case "complementary" `Quick test_unify_complementary;
      Alcotest.test_case "diff pred fail" `Quick test_fail_complementary_diff_pred;
    ];
    "substitution", [
      Alcotest.test_case "compose" `Quick test_compose;
    ];
  ]
