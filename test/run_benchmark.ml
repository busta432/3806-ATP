(* test/run_benchmark.ml *)
open Atp_ocaml.Types

let read_whole_file filename =
  let ch = open_in filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let extract_status content =
  let lines = String.split_on_char '\n' content in
  let found = List.find_opt (fun l ->
    let t = String.trim l in
    let n = String.length t in
    n >= 8 && String.sub t 0 8 = "% Status"
  ) lines in
  match found with
  | None -> "Unknown"
  | Some l ->
      (match String.split_on_char ':' l with
       | _ :: v :: _ -> String.trim v
       | _ -> "Unknown")

let build_problem decls =
  let axioms = List.filter_map (fun (_, role, f) ->
    if role = "axiom" || role = "hypothesis" || role = "definition"
       || role = "lemma" || role = "theorem" then Some f else None
  ) decls in
  let conjectures = List.filter_map (fun (_, role, f) ->
    if role = "conjecture" || role = "negated_conjecture" then Some f else None
  ) decls in
  let conjecture = match conjectures with
    | [] -> Atp_ocaml.Types.Top
    | [c] -> c
    | c::cs -> List.fold_left (fun acc f -> And(acc, f)) c cs
  in
  match axioms with
  | [] -> conjecture
  | a::as_ ->
      let premise = List.fold_left (fun acc f -> And(acc, f)) a as_ in
      Implies (premise, conjecture)

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
  inst_attempts=0; inst_hits=0; clauses_gen=0; subsumptions=0;
}

let result_status solved time_ms =
  if solved then ("Proved", "PROVED")
  else if time_ms >= 4900. then ("Timeout", "TIMEOUT")
  else ("NotProved", "NOT_PROVED")

let write_csv_row oc ~file ~folder ~engine ~expected ~solved ~time_ms ~steps ~depth
    ~inst_attempts ~inst_hits ~clauses_gen ~subsumptions =
  let result, status = result_status solved time_ms in
  Printf.fprintf oc "%S,%S,%S,%S,%S,%.3f,%S,%d,%d,%d,%d,%d,%d\n"
    file folder engine expected result (time_ms /. 1000.)
    status steps depth inst_attempts inst_hits clauses_gen subsumptions;
  flush oc

let print_table title base_stats improved_stats res_stats =
  let print_stats name r =
    let rate = if r.total = 0 then 0.0 else (float_of_int r.solved /. float_of_int r.total) *. 100. in
    let hit_rate = if r.inst_attempts = 0 then 0.0 else (float_of_int r.inst_hits /. float_of_int r.inst_attempts) *. 100. in
    let inst_att = if name <> "Improved" then "N/A" else string_of_int r.inst_attempts in
    let inst_hit = if name <> "Improved" then "N/A" else Printf.sprintf "%.1f%%" hit_rate in
    let cls_gen = if name <> "Resolution" then "N/A" else string_of_int r.clauses_gen in
    let subs = if name <> "Resolution" then "N/A" else string_of_int r.subsumptions in
    Printf.printf "%-12s | %6.1f%% | %8.3f | %6d | %5d | %7s | %8s | %7s | %7s\n"
      name rate (r.time_ms /. 1000.0) r.steps r.max_depth inst_att inst_hit cls_gen subs
  in
  Printf.printf "\n### %s\n" title;
  Printf.printf "\n%-12s | %-7s | %-8s | %-6s | %-5s | %-7s | %-8s | %-7s | %-7s\n"
    "Engine" "Solve %" "Time(s)" "Steps" "Depth" "InstAtt" "InstHit%" "ClsGen" "Subsump";
  Printf.printf "%s\n" (String.make 100 '-');
  print_stats "Baseline" base_stats;
  print_stats "Improved" improved_stats;
  print_stats "Resolution" res_stats

let timeout_ms = 5000.

let run () =
  let bench_dir = "benchmark_clean/TPTP/benchmark" in
  let timestamp = Unix.gettimeofday () |> int_of_float |> string_of_int in
  let csv_path = Printf.sprintf "benchmark_results/results_all_%s.csv" timestamp in
  let csv_oc = open_out csv_path in
  Printf.fprintf csv_oc "file,folder,engine,expected,result,time_s,status,steps,depth,inst_attempts,inst_hits,clauses_gen,subsumptions\n";
  flush csv_oc;
  Printf.printf "Writing per-problem CSV to: %s\n%!" csv_path;

  let load_category subdir =
    let dir = Filename.concat bench_dir subdir in
    if not (Sys.file_exists dir && Sys.is_directory dir) then (
      Printf.printf "Category directory not found: %s\n%!" dir; []
    ) else
    let files = Sys.readdir dir |> Array.to_list
      |> List.filter (fun f -> Filename.check_suffix f ".p")
      |> List.sort compare
      |> List.map (fun f -> Filename.concat dir f)
    in
    List.filter_map (fun path ->
      try
        let content = read_whole_file path in
        let expected = extract_status content in
        let lexbuf = Lexing.from_string content in
        let decls = Atp_ocaml.Tptp_parser.tptp_file Atp_ocaml.Tptp_lexer.tokenize lexbuf in
        Some (path, build_problem decls, expected)
      with _ -> None
    ) files
  in

  let run_cat title problems =
    let base_stats = new_stats () in
    let improved_stats = new_stats () in
    let res_stats = new_stats () in
    Printf.printf "Evaluating %s (%d problems)...\n%!" title (List.length problems);

    let sorted = List.sort (fun (f1,_,_) (f2,_,_) -> compare f1 f2) problems in

    List.iteri (fun i (path, problem, expected) ->
      let fname = Filename.basename path in
      Printf.printf "[%d/%d] Testing %s...\n%!" (i + 1) (List.length sorted) fname;
      base_stats.total <- base_stats.total + 1;
      improved_stats.total <- improved_stats.total + 1;
      res_stats.total <- res_stats.total + 1;

      let res_b = Atp_ocaml.Baseline.prove problem timeout_ms in
      if res_b.solved then base_stats.solved <- base_stats.solved + 1;
      base_stats.time_ms <- base_stats.time_ms +. res_b.stats.time_ms;
      base_stats.steps <- base_stats.steps + res_b.stats.steps;
      base_stats.max_depth <- max base_stats.max_depth res_b.stats.max_depth;
      write_csv_row csv_oc ~file:fname ~folder:title ~engine:"Baseline" ~expected
        ~solved:res_b.solved ~time_ms:res_b.stats.time_ms ~steps:res_b.stats.steps
        ~depth:res_b.stats.max_depth ~inst_attempts:0 ~inst_hits:0 ~clauses_gen:0 ~subsumptions:0;

      let res_imp = Atp_ocaml.Improved.prove problem timeout_ms in
      if res_imp.solved then improved_stats.solved <- improved_stats.solved + 1;
      improved_stats.time_ms <- improved_stats.time_ms +. res_imp.stats.time_ms;
      improved_stats.steps <- improved_stats.steps + res_imp.stats.steps;
      improved_stats.max_depth <- max improved_stats.max_depth res_imp.stats.max_depth;
      improved_stats.inst_attempts <- improved_stats.inst_attempts + res_imp.stats.inst_attempts;
      improved_stats.inst_hits <- improved_stats.inst_hits + res_imp.stats.inst_hits;
      write_csv_row csv_oc ~file:fname ~folder:title ~engine:"Improved" ~expected
        ~solved:res_imp.solved ~time_ms:res_imp.stats.time_ms ~steps:res_imp.stats.steps
        ~depth:res_imp.stats.max_depth ~inst_attempts:res_imp.stats.inst_attempts
        ~inst_hits:res_imp.stats.inst_hits ~clauses_gen:0 ~subsumptions:0;

      let res_r = Atp_ocaml.Resolution.prove problem timeout_ms in
      if res_r.solved then res_stats.solved <- res_stats.solved + 1;
      res_stats.time_ms <- res_stats.time_ms +. res_r.stats.time_ms;
      res_stats.steps <- res_stats.steps + res_r.stats.steps;
      res_stats.clauses_gen <- res_stats.clauses_gen + res_r.stats.clauses_gen;
      res_stats.subsumptions <- res_stats.subsumptions + res_r.stats.subsumptions;
      write_csv_row csv_oc ~file:fname ~folder:title ~engine:"Resolution" ~expected
        ~solved:res_r.solved ~time_ms:res_r.stats.time_ms ~steps:res_r.stats.steps
        ~depth:res_r.stats.max_depth ~inst_attempts:0 ~inst_hits:0
        ~clauses_gen:res_r.stats.clauses_gen ~subsumptions:res_r.stats.subsumptions;

    ) sorted;
    print_table title base_stats improved_stats res_stats
  in

  run_cat "Pelletier"  (load_category "Pelletier");
  run_cat "TPTP_SYN"   (load_category "TPTP_SYN");
  run_cat "LogicBench" (load_category "LogicBench");
  run_cat "FOLIO"      (load_category "FOLIO");

  close_out csv_oc;
  Printf.printf "\nCSV results saved to: %s\n%!" csv_path

let () = run ()
