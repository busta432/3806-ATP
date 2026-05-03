(* test/evaluate_domains.ml *)
open Atp_ocaml.Types

let read_whole_file filename =
  let ch = open_in filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let build_problem decls =
  let axioms = List.filter_map (function
    | Fof (_, role, f) when role = "axiom" || role = "hypothesis" || role = "definition" || role = "lemma" || role = "theorem" -> Some f
    | _ -> None
  ) decls in
  let conjectures = List.filter_map (function
    | Fof (_, role, f) when role = "conjecture" || role = "negated_conjecture" -> Some f
    | _ -> None
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
  mutable solve_times : float list;
  mutable solve_steps : int list;
  mutable max_depth : int;
  mutable inst_attempts : int;
  mutable inst_hits : int;
  mutable clauses_gen : int;
  mutable subsumptions : int;
}

let new_stats () = {
  solved=0; total=0; solve_times=[]; solve_steps=[]; max_depth=0;
  inst_attempts=0; inst_hits=0;
  clauses_gen=0; subsumptions=0;
}

let median l =
  let sorted = List.sort compare l in
  let len = List.length sorted in
  if len = 0 then 0.0
  else if len mod 2 = 1 then List.nth sorted (len / 2)
  else
    let m1 = List.nth sorted (len / 2 - 1) in
    let m2 = List.nth sorted (len / 2) in
    (m1 +. m2) /. 2.0

let median_int l =
  let sorted = List.sort compare l in
  let len = List.length sorted in
  if len = 0 then 0
  else if len mod 2 = 1 then List.nth sorted (len / 2)
  else (List.nth sorted (len / 2 - 1) + List.nth sorted (len / 2)) / 2

let std_dev l mean =
  let len = List.length l in
  if len < 2 then 0.0
  else
    let sum_sq_diff = List.fold_left (fun acc x -> acc +. (x -. mean) ** 2.0) 0.0 l in
    sqrt (sum_sq_diff /. float_of_int len)

let print_table title base_stats improved_stats res_stats =
  let print_stats name r =
    let rate = if r.total = 0 then 0.0 else (float_of_int r.solved /. float_of_int r.total) *. 100. in
    let total_time = List.fold_left (+.) 0.0 r.solve_times in
    let total_steps = List.fold_left (+) 0 r.solve_steps in
    let mean_time = if r.solved = 0 then 0.0 else total_time /. float_of_int r.solved in
    let med_time = median r.solve_times in
    let mean_steps = if r.solved = 0 then 0.0 else float_of_int total_steps /. float_of_int r.solved in
    let med_steps = median_int r.solve_steps in
    let sd_time = std_dev r.solve_times mean_time in
    
    let hit_rate = if r.inst_attempts = 0 then 0.0 else (float_of_int r.inst_hits /. float_of_int r.inst_attempts) *. 100. in
    let inst_att = if name <> "Improved" then "N/A" else string_of_int r.inst_attempts in
    let inst_hit = if name <> "Improved" then "N/A" else Printf.sprintf "%.1f%%" hit_rate in
    let cls_gen = if name <> "Resolution" then "N/A" else string_of_int r.clauses_gen in
    let subs = if name <> "Resolution" then "N/A" else string_of_int r.subsumptions in
    
    Printf.printf "| %-10s | %6.1f%% | %8.3f | %8.3f | %8.3f | %6d | %8.1f | %6d | %5d | %7s | %8s | %7s | %7s |\n"
      name rate (mean_time /. 1000.0) (med_time /. 1000.0) (sd_time /. 1000.0) 
      total_steps mean_steps med_steps r.max_depth inst_att inst_hit cls_gen subs
  in
  Printf.printf "\n### %s\n\n" title;
  Printf.printf "| Engine     | Solve %% | Mean T(s) | Med T(s) | SD T(s) | Steps | Mean St | Med St | Depth | InstAtt | InstHit%% | ClsGen  | Subsump |\n";
  Printf.printf "|------------|---------|-----------|----------|---------|-------|---------|--------|-------|---------|----------|---------|---------|\n";
  print_stats "Baseline" base_stats;
  print_stats "Improved" improved_stats;
  print_stats "Resolution" res_stats;
  Printf.printf "\n"

let is_propositional f =
  let rec aux = function
    | Top | Bot | Pred _ -> true
    | Not a -> aux a
    | And (a, b) | Or (a, b) | Implies (a, b) | Iff (a, b) -> aux a && aux b
    | Forall _ | Exists _ -> false
  in aux f

let is_pelletier_deep filename =
  let base = Filename.basename filename in
  if String.length base >= 3 && String.sub base 0 3 = "SYN" then true
  else false

let is_tptp_deep filename =
  let base = Filename.basename filename in
  String.length base >= 3 && String.sub base 0 3 = "SET"

let run () =
  let bench_dir = "benchmark_clean" in
  let rec get_files dir =
    if not (Sys.is_directory dir) then [] else
    let items = Sys.readdir dir |> Array.to_list in
    List.fold_left (fun acc item ->
      let path = Filename.concat dir item in
      if Sys.is_directory path then acc @ (get_files path)
      else if Filename.check_suffix path ".p" then path :: acc
      else acc
    ) [] items
  in
  let all_files = get_files bench_dir in
  
  let domain_a = ref [] in (* Propositional *)
  let domain_b = ref [] in (* Shallow FOL (SYN problems) *)
  let domain_c = ref [] in (* Deep FOL (SET problems) *)

  Printf.printf "Scanning %d files for categorization...\n%!" (List.length all_files);

  List.iter (fun f ->
    try
      let content = read_whole_file f in
      let lexbuf = Lexing.from_string content in
      let decls = Atp_ocaml.Tptp_parser.tptp_file Atp_ocaml.Tptp_lexer.tokenize lexbuf in
      let has_include = List.exists (function Include _ -> true | _ -> false) decls in
      if not has_include then (
        let problem = build_problem decls in
        if is_propositional problem then
          domain_a := (f, problem) :: !domain_a
        else if is_pelletier_deep f then
          domain_b := (f, problem) :: !domain_b
        else if is_tptp_deep f then
          domain_c := (f, problem) :: !domain_c
      )
    with _ -> ()
  ) all_files;

  let run_domain title problems =
    let base_stats = new_stats () in
    let improved_stats = new_stats () in
    let res_stats = new_stats () in
    
    let problems_to_run = 
      if List.length problems > (if title = "Domain C: Deep FOL (SET)" then 10 else 50) then 
        List.filteri (fun i _ -> i < (if title = "Domain C: Deep FOL (SET)" then 10 else 50)) (List.sort (fun (a,_) (b,_) -> compare a b) problems)
      else problems 
    in

    Printf.printf "Evaluating %s (%d problems)...\n%!" title (List.length problems_to_run);
    
    List.iteri (fun i (f, problem) ->
      if i mod 5 = 0 then Printf.printf "  [%d/%d] %s\n%!" i (List.length problems_to_run) f;
      base_stats.total <- base_stats.total + 1;
      improved_stats.total <- improved_stats.total + 1;
      res_stats.total <- res_stats.total + 1;
      
      let res_b = Atp_ocaml.Baseline.prove problem 2000. in
      if res_b.solved then (
        base_stats.solved <- base_stats.solved + 1;
        base_stats.solve_times <- res_b.stats.time_ms :: base_stats.solve_times;
        base_stats.solve_steps <- res_b.stats.steps :: base_stats.solve_steps;
      );
      base_stats.max_depth <- max base_stats.max_depth res_b.stats.max_depth;

      let res_imp = Atp_ocaml.Improved.prove problem 2000. in
      if res_imp.solved then (
        improved_stats.solved <- improved_stats.solved + 1;
        improved_stats.solve_times <- res_imp.stats.time_ms :: improved_stats.solve_times;
        improved_stats.solve_steps <- res_imp.stats.steps :: improved_stats.solve_steps;
      );
      improved_stats.max_depth <- max improved_stats.max_depth res_imp.stats.max_depth;
      improved_stats.inst_attempts <- improved_stats.inst_attempts + res_imp.stats.inst_attempts;
      improved_stats.inst_hits <- improved_stats.inst_hits + res_imp.stats.inst_hits;
      
      let res_r = Atp_ocaml.Resolution.prove problem 2000. in
      if res_r.solved then (
        res_stats.solved <- res_stats.solved + 1;
        res_stats.solve_times <- res_r.stats.time_ms :: res_stats.solve_times;
        res_stats.solve_steps <- res_r.stats.steps :: res_stats.solve_steps;
      );
      res_stats.clauses_gen <- res_stats.clauses_gen + res_r.stats.clauses_gen;
      res_stats.subsumptions <- res_stats.subsumptions + res_r.stats.subsumptions;
    ) problems_to_run;
    print_table title base_stats improved_stats res_stats
  in

  run_domain "Domain A: Propositional" !domain_a;
  run_domain "Domain B: Shallow FOL (SYN)" !domain_b;
  run_domain "Domain C: Deep FOL (SET)" !domain_c

let () = run ()
