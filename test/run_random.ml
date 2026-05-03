(* test/run_random.ml *)
open Atp_ocaml.Types

let read_lines filename =
  let lines = ref [] in
  let ch = open_in filename in
  try
    while true; do
      lines := input_line ch :: !lines
    done; !lines
  with End_of_file ->
    close_in ch;
    List.rev !lines

type engine_stats = {
  mutable solved : int;
  mutable total : int;
  mutable time_ms : float;
  mutable steps : int;
  mutable max_depth : int;
  mutable inst_attempts : int;
  mutable inst_hits : int;
  mutable clauses_gen : int;
  mutable subsumptions : int;
}

let new_stats () = {
  solved=0; total=0; time_ms=0.0; steps=0; max_depth=0;
  inst_attempts=0; inst_hits=0;
  clauses_gen=0; subsumptions=0;
}

let run () =
  let lines = read_lines "test/random_benchmark.txt" in
  
  let base_stats = new_stats () in
  let improved_stats = new_stats () in
  let res_stats = new_stats () in
  
  Printf.printf "Found %d random problems.\n%!" (List.length lines);
  
  List.iteri (fun i line ->
    try
      let parts = String.split_on_char '|' line in
      let f_str = List.nth parts 2 in
      let lexbuf = Lexing.from_string f_str in
      let problem = Atp_ocaml.Parser.formula_eof Atp_ocaml.Lexer.tokenize lexbuf in
      
      base_stats.total <- base_stats.total + 1;
      improved_stats.total <- improved_stats.total + 1;
      res_stats.total <- res_stats.total + 1;
      
      (* Baseline Engine Evaluation *)
      let res_b = Atp_ocaml.Baseline.prove problem 2000. in
      if res_b.solved then base_stats.solved <- base_stats.solved + 1;
      base_stats.time_ms <- base_stats.time_ms +. res_b.stats.time_ms;
      base_stats.steps <- base_stats.steps + res_b.stats.steps;
      base_stats.max_depth <- max base_stats.max_depth res_b.stats.max_depth;
      
      (* Improved Engine Evaluation *)
      let res_imp = Atp_ocaml.Improved.prove problem 2000. in
      if res_imp.solved then improved_stats.solved <- improved_stats.solved + 1;
      improved_stats.time_ms <- improved_stats.time_ms +. res_imp.stats.time_ms;
      improved_stats.steps <- improved_stats.steps + res_imp.stats.steps;
      improved_stats.max_depth <- max improved_stats.max_depth res_imp.stats.max_depth;
      improved_stats.inst_attempts <- improved_stats.inst_attempts + res_imp.stats.inst_attempts;
      improved_stats.inst_hits <- improved_stats.inst_hits + res_imp.stats.inst_hits;
      
      (* Resolution Engine Evaluation *)
      let res_r = Atp_ocaml.Resolution.prove problem 2000. in
      if res_r.solved then res_stats.solved <- res_stats.solved + 1;
      res_stats.time_ms <- res_stats.time_ms +. res_r.stats.time_ms;
      res_stats.steps <- res_stats.steps + res_r.stats.steps;
      res_stats.clauses_gen <- res_stats.clauses_gen + res_r.stats.clauses_gen;
      res_stats.subsumptions <- res_stats.subsumptions + res_r.stats.subsumptions;

      if (i + 1) mod 50 = 0 then Printf.printf "Processed %d problems...\n%!" (i + 1)
    with e -> 
      Printf.printf "Error parsing/proving problem %d: %s\n%!" (i+1) (Printexc.to_string e)
  ) lines;
  
  let print_stats name r =
    let rate = if r.total = 0 then 0.0 else (float_of_int r.solved /. float_of_int r.total) *. 100. in
    let hit_rate = if r.inst_attempts = 0 then 0.0 else (float_of_int r.inst_hits /. float_of_int r.inst_attempts) *. 100. in
    let inst_att = if name = "Resolution" || name = "Baseline" then "N/A" else string_of_int r.inst_attempts in
    let inst_hit = if name = "Resolution" || name = "Baseline" then "N/A" else Printf.sprintf "%.1f%%" hit_rate in
    let cls_gen = if name <> "Resolution" then "N/A" else string_of_int r.clauses_gen in
    let subs = if name <> "Resolution" then "N/A" else string_of_int r.subsumptions in
    Printf.printf "%-12s | %6.1f%% | %8.3f | %6d | %5d | %7s | %8s | %7s | %7s\n"
      name rate (r.time_ms /. 1000.0) r.steps r.max_depth inst_att inst_hit cls_gen subs
  in
  
  Printf.printf "\n%-12s | %-7s | %-8s | %-6s | %-5s | %-7s | %-8s | %-7s | %-7s\n"
    "Engine" "Solve %" "Time(s)" "Steps" "Depth" "InstAtt" "InstHit%" "ClsGen" "Subsump";
  Printf.printf "%s\n" (String.make 100 '-');
  print_stats "Baseline" base_stats;
  print_stats "Improved" improved_stats;
  print_stats "Resolution" res_stats

let () = run ()
