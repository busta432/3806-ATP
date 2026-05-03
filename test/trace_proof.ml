(* test/trace_proof.ml *)
open Atp_ocaml.Types
open Atp_ocaml.Printer

let run_trace f_str =
  let lexbuf = Lexing.from_string f_str in
  let formula = Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf in
  
  Printf.printf "\n%s\n" (String.make 60 '=');
  Printf.printf "TRACING PROOF FOR: %s\n" (pp_formula formula);
  Printf.printf "%s\n" (String.make 60 '=');

  (* 1. Baseline Trace *)
  Printf.printf "\n[1] ENGINE 1: BASELINE (Ground Enumeration)\n";
  Printf.printf "--------------------------------------------\n";
  (* The baseline is hard to trace without internal printfs, 
     but we can at least show the final result and stats. *)
  let res_b = Atp_ocaml.Baseline.prove formula 1000. in
  Printf.printf "Result: %s\n" (if res_b.solved then "PROVED" else "FAILED");
  Printf.printf "%s\n" (pp_stats res_b.stats);

  (* 2. Improved Trace *)
  Printf.printf "\n[2] ENGINE 2: IMPROVED (Metavariables + Unification)\n";
  Printf.printf "----------------------------------------------------\n";
  let res_i = Atp_ocaml.Improved.prove formula 1000. in
  Printf.printf "Result: %s\n" (if res_i.solved then "PROVED" else "FAILED");
  Printf.printf "%s\n" (pp_stats res_i.stats);

  (* 3. Resolution Trace *)
  Printf.printf "\n[3] ENGINE 3: RESOLUTION (Saturation)\n";
  Printf.printf "---------------------------------------\n";
  let res_r = Atp_ocaml.Resolution.prove formula 1000. in
  Printf.printf "Result: %s\n" (if res_r.solved then "PROVED" else "FAILED");
  Printf.printf "%s\n" (pp_stats res_r.stats)

let () =
  run_trace "forall x. (P(x) -> P(x))"
