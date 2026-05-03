(* test/verify_unification_chains.ml *)
open Atp_ocaml.Types
open Atp_ocaml.Unification

let make_chain n =
  let rec aux i acc =
    if i >= n then acc
    else 
      let x = "x" ^ string_of_int i in
      let y = Var ("x" ^ string_of_int (i + 1)) in
      aux (i + 1) ((x, y) :: acc)
  in aux 0 []

let test_deep_chain () =
  Printf.printf "Testing deep substitution chain (length 5000)...\n";
  let n = 5000 in
  let sigma = make_chain n in
  let term = Var "x0" in
  let result = apply sigma term in
  match result with
  | Var x when x = "x" ^ string_of_int n -> 
      Printf.printf "  [PASS] Resolved x0 to %s iteratively.\n" x
  | _ -> 
      Printf.printf "  [FAIL] Failed to resolve chain. Got: %s\n" (Atp_ocaml.Printer.pp_term result);
      exit 1

let test_occurs_check_chain () =
  Printf.printf "Testing occurs check with deep chain...\n";
  let n = 1000 in
  let sigma = make_chain n in
  (* x0 -> x1 -> ... -> xn *)
  (* Check if xn occurs in x0 *)
  if occurs ("x" ^ string_of_int n) sigma (Var "x0") then
    Printf.printf "  [PASS] Correctly detected x%d in x0.\n" n
  else (
    Printf.printf "  [FAIL] Failed to detect variable at end of chain.\n";
    exit 1
  )

let test_standard_unification () =
  Printf.printf "Testing standard FO unification regressions...\n";
  let is_subst _ = true in
  let t1 = Func("f", [Var "x"; Func("g", [Var "x"])]) in
  let t2 = Func("f", [Func("a", []); Var "y"]) in
  match unify ~use_rank_check:false is_subst [] [(t1, t2)] with
  | Some sigma ->
      let res1 = apply sigma t1 in
      let res2 = apply sigma t2 in
      if res1 = res2 then Printf.printf "  [PASS] Unified complex terms correctly.\n"
      else (Printf.printf "  [FAIL] Terms not equal after substitution.\n"; exit 1)
  | None -> Printf.printf "  [FAIL] Failed to unify compatible terms.\n"; exit 1

let () =
  test_deep_chain ();
  test_occurs_check_chain ();
  test_standard_unification ();
  Printf.printf "\nALL UNIFICATION SAFETY TESTS PASSED.\n"
