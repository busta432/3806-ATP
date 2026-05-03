(** main.ml — CLI entry point for ATP-OCaml.
    Uses cmdliner for a robust command-line interface. *)

open Atp_ocaml.Types
open Atp_ocaml.Printer

(* Helper to parse TPTP declarations into a single formula: (A1 & A2 & ...) => C *)
let tptp_to_formula decls =
  let rec collect axioms conjecture = function
    | [] -> (axioms, conjecture)
    | (_, role, f) :: rest ->
      if role = "conjecture" then
        collect axioms (Some f) rest
      else
        (* Treat axioms, hypotheses, lemmas, etc. as antecedents *)
        collect (f :: axioms) conjecture rest
  in
  let axioms, conjecture = collect [] None decls in
  let ant = match axioms with
    | [] -> Top
    | [f] -> f
    | fs -> List.fold_left (fun acc f -> And (f, acc)) (List.hd fs) (List.tl fs)
  in
  let con = match conjecture with
    | Some f -> f
    | None -> 
      (* If no conjecture, we might be looking for a contradiction in the axioms *)
      Bot
  in
  if ant = Top then con else Implies (ant, con)

let parse_input input =
  if Sys.file_exists input then (
    let ic = open_in input in
    let lexbuf = Lexing.from_channel ic in
    Lexing.set_filename lexbuf input;
    let result = 
      try 
        let decls = Atp_ocaml.Tptp_parser.tptp_file Atp_ocaml.Tptp_lexer.tokenize lexbuf in
        Some (tptp_to_formula decls)
      with e -> 
        Printf.printf "TPTP Parse Error: %s\n" (Printexc.to_string e);
        None
    in
    close_in ic;
    result
  ) else (
    let lexbuf = Lexing.from_string input in
    try Some (Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf)
    with _ -> None
  )

let run_engine engine_name input timeout =
  Printf.printf "------------------------------------------------------------\n";
  Printf.printf "ATP-OCaml %s Engine\n" engine_name;
  Printf.printf "------------------------------------------------------------\n";
  
  match parse_input input with
  | None -> 
    Printf.printf "Error: Could not parse input (formula or TPTP file): %s\n" input
  | Some f ->
    Printf.printf "Formula: %s\n" (pp_formula f);
    Printf.printf "Searching for proof...\n";
    
    let result = match engine_name with
      | "Baseline" -> Atp_ocaml.Baseline.prove f (float_of_int timeout)
      | "Improved" -> Atp_ocaml.Improved.prove f (float_of_int timeout)
      | "Resolution" -> Atp_ocaml.Resolution.prove f (float_of_int timeout)
      | _ -> failwith "Unsupported engine"
    in
    
    if result.solved then (
      Printf.printf "Result: PROVED!\n"
    ) else (
      Printf.printf "Result: NOT PROVED within limits.\n"
    );
    
    (* Always print stats even if not proved *)
    Printf.printf "Steps: %d\n" result.stats.steps;
    Printf.printf "Max tree depth: %d\n" result.stats.max_depth;
    Printf.printf "Time: %.2f ms\n" result.stats.time_ms;
    
    (match result.engine with
     | Baseline | Improved ->
       Printf.printf "Instantiation attempts: %d\n" result.stats.inst_attempts;
       Printf.printf "Unification hits: %d\n" result.stats.inst_hits
     | Resolution ->
       Printf.printf "Clauses generated: %d\n" result.stats.clauses_gen;
       Printf.printf "Subsumptions applied: %d\n" result.stats.subsumptions)

open Cmdliner

let engine =
  let doc = "Engine to use (Baseline, Improved, Resolution)." in
  Arg.(value & opt string "Baseline" & info ["e"; "engine"] ~docv:"ENGINE" ~doc)

let input =
  let doc = "FOL formula or path to TPTP (.p) file." in
  Arg.(required & pos 0 (some string) None & info [] ~docv:"INPUT" ~doc)

let timeout =
  let doc = "Timeout in milliseconds." in
  Arg.(value & opt int 5000 & info ["t"; "timeout"] ~docv:"MS" ~doc)

let atp_t = Term.(const run_engine $ engine $ input $ timeout)

let cmd =
  let doc = "Automated Theorem Prover for First-Order Logic" in
  let info = Cmd.info "atp" ~version:"0.1.0" ~doc in
  Cmd.v info atp_t

let () = exit (Cmd.eval cmd)
