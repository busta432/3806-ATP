(** baseline.ml — ENGINE 1: Baseline LK' Backward Search (Algorithm 2).
    
    Faithful implementation of Algorithm 2 from Zhe Hou's textbook.
    Performs a goal-directed backward search in the LK' sequent calculus.
    To handle quantifiers naively but completely, it uses a depth-limited
    search with a growing Herbrand universe.
    
    Reference:
    - Hou (2021), Fundamentals of Logic and Computation, p. 67. *)

open Types
open Formula

exception Timeout_exn
let deadline = ref 0.

(* ================================================================ *)
(* HERBRAND UNIVERSE ENUMERATION                                     *)
(* ================================================================ *)

(** Generate all terms up to a certain depth using the given 
    function symbols and base terms (constants/free variables). *)
let rec enumerate_terms functions base_terms max_depth =
  if max_depth < 0 then []
  else if max_depth = 0 then base_terms
  else
    let smaller_terms = enumerate_terms functions base_terms (max_depth - 1) in
    let new_terms = 
      List.concat_map (fun (name, arity) ->
        if arity = 0 then [] (* Constants are already in base_terms *)
        else
          let rec n_ary_product n =
            if n = 0 then [[]]
            else
              let tails = n_ary_product (n - 1) in
              List.concat_map (fun head ->
                List.map (fun tail -> head :: tail) tails
              ) smaller_terms
          in
          List.map (fun args -> Func (name, args)) (n_ary_product arity)
      ) functions
    in
    unique (base_terms @ new_terms)

(** Get all function symbols and base terms from a sequent. 
    If no base terms, add a default constant "c". *)
let get_functions_and_base_terms { antecedent; succedent } =
  let forms = antecedent @ succedent in
  let all_fs = List.concat_map functions_of forms |> List.filter (fun (_, a) -> a > 0) in
  let fvs = List.concat_map free_vars forms |> unique |> List.map (fun v -> Var v) in
  let consts = List.concat_map constants_of forms |> unique |> List.map (fun c -> Func (c, [])) in
  let bases = unique (fvs @ consts) in
  let final_bases = if bases = [] then [Func ("c", [])] else bases in
  unique all_fs, final_bases

(* ================================================================ *)
(* PROOF SEARCH CORE                                                 *)
(* ================================================================ *)

let is_identity { antecedent; succedent } =
  List.exists (fun a -> List.exists (fun s -> formula_equal a s) succedent) antecedent

(** Main search function.
    Strictly prioritized based on the if-else chain in Algorithm 2.
    [used] tracks (formula, term) pairs already instantiated on this branch. *)
let rec search (stats : prover_stats) max_depth term_limit used toggle current_depth sequent =
  stats.steps <- stats.steps + 1;
  stats.max_depth <- max current_depth stats.max_depth;
  if stats.steps mod 1000 = 0 && Unix.gettimeofday () > !deadline then None else

  (* 1. Tier 1: Axiom check *)
  if is_identity sequent then Some (Axiom (Identity, sequent))
  else if List.mem Top sequent.succedent then Some (Axiom (TopRight, sequent))
  else if List.mem Bot sequent.antecedent then Some (Axiom (BotLeft, sequent))
  else if max_depth <= 0 then None
  else
    let rec try_rules = function
      | [] -> None
      | r :: rs ->
          (match apply_rule stats (max_depth - 1) term_limit used (not toggle) (current_depth + 1) sequent r with
           | Some tree -> Some tree
           | None -> try_rules rs)
    in
    (* 2. Tier 2: Non-branching propositional and eigenvariable rules *)
    let rules2 = find_all_tier2_rules sequent toggle in
    if rules2 <> [] then try_rules rules2
    else
      (* 3. Tier 3: Branching propositional rules *)
      let rules3 = find_all_tier3_rules sequent toggle in
      if rules3 <> [] then try_rules rules3
      else
        (* 4. Tier 4: Quantifier instantiation with UNUSED EXISTING terms *)
        let apps4 = find_all_tier4_applications sequent term_limit used toggle in
        if apps4 <> [] then
          let rec try_apps = function
            | [] -> None
            | (r, t) :: rs ->
                (match apply_quantifier_instantiation stats (max_depth - 1) term_limit used (not toggle) (current_depth + 1) sequent r t with
                 | Some tree -> Some tree
                 | None -> try_apps rs)
          in try_apps apps4
        else
          (* 5. Tier 5: Quantifier instantiation with FRESH term *)
          let rules5 = find_all_tier5_rules sequent toggle in
          if rules5 <> [] then
            let rec try_fresh = function
              | [] -> None
              | r :: rs ->
                  let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
                  let z' = variant "z" avoid in
                  (match apply_quantifier_instantiation stats (max_depth - 1) term_limit used (not toggle) (current_depth + 1) sequent r (Var z') with
                   | Some tree -> Some tree
                   | None -> try_fresh rs)
            in try_fresh rules5
          else None

(** Apply a specific rule at a sequent. *)
and apply_rule stats depth term_limit used next_toggle current_depth sequent rule =
  let children_sequents = match rule with
    | AndLeft i ->
        let a, b = match List.nth sequent.antecedent i with And(a,b) -> a,b | _ -> failwith "AndL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = a :: b :: ant' }]
    | OrRight i ->
        let a, b = match List.nth sequent.succedent i with Or(a,b) -> a,b | _ -> failwith "OrR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = a :: b :: suc' }]
    | ImpliesRight i ->
        let a, b = match List.nth sequent.succedent i with Implies(a,b) -> a,b | _ -> failwith "ImpR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ antecedent = a :: sequent.antecedent; succedent = b :: suc' }]
    | NotLeft i ->
        let a = match List.nth sequent.antecedent i with Not a -> a | _ -> failwith "NotL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ antecedent = ant'; succedent = a :: sequent.succedent }]
    | NotRight i ->
        let a = match List.nth sequent.succedent i with Not a -> a | _ -> failwith "NotR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ antecedent = a :: sequent.antecedent; succedent = suc' }]
    | IffLeft i ->
        let a, b = match List.nth sequent.antecedent i with Iff(a,b) -> a,b | _ -> failwith "IffL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = Implies(a,b) :: Implies(b,a) :: ant' }]
    | ForallRight (i, _) ->
        let x, body = match List.nth sequent.succedent i with Forall(x, b) -> x, b | _ -> failwith "forallR" in
        let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
        let x' = variant x avoid in
        let body' = subst [(x, Var x')] body in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = body' :: suc' }]
    | ExistsLeft (i, _) ->
        let x, body = match List.nth sequent.antecedent i with Exists(x, b) -> x, b | _ -> failwith "existsL" in
        let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
        let x' = variant x avoid in
        let body' = subst [(x, Var x')] body in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = body' :: ant' }]
    | AndRight i ->
        let a, b = match List.nth sequent.succedent i with And(a,b) -> a,b | _ -> failwith "AndR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = a :: suc' }; { sequent with succedent = b :: suc' }]
    | OrLeft i ->
        let a, b = match List.nth sequent.antecedent i with Or(a,b) -> a,b | _ -> failwith "OrL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ sequent with antecedent = a :: ant' }; { sequent with antecedent = b :: ant' }]
    | ImpliesLeft i ->
        let a, b = match List.nth sequent.antecedent i with Implies(a,b) -> a,b | _ -> failwith "ImpL" in
        let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        [{ antecedent = ant'; succedent = a :: sequent.succedent }; { sequent with antecedent = b :: ant' }]
    | IffRight i ->
        let a, b = match List.nth sequent.succedent i with Iff(a,b) -> a,b | _ -> failwith "IffR" in
        let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
        [{ sequent with succedent = Implies(a,b) :: suc' }; { sequent with succedent = Implies(b,a) :: suc' }]
    | _ -> failwith "Quantifier instantiation rule in non-quantifier handler"
  in
  let rec prove_all = function
    | [] -> Some []
    | g :: gs ->
        (match search stats depth term_limit used next_toggle current_depth g with
         | None -> None
         | Some t -> match prove_all gs with None -> None | Some ts -> Some (t :: ts))
  in
  match prove_all children_sequents with
  | Some trees -> Some (Inference (rule, sequent, trees))
  | None -> None

and apply_quantifier_instantiation stats depth term_limit used next_toggle current_depth sequent rule t =
  stats.inst_attempts <- stats.inst_attempts + 1;
  let s' = match rule with
    | ForallLeft (i, _) ->
        let f = List.nth sequent.antecedent i in
        let x, body = match f with Forall(x, b) -> x, b | _ -> failwith "ForallL" in
        let body' = subst [(x, t)] body in
        let ant_rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
        { sequent with antecedent = body' :: (ant_rest @ [f]) } (* Contraction *)
    | ExistsRight (i, _) ->
        let f = List.nth sequent.succedent i in
        let x, body = match f with Exists(x, b) -> x, b | _ -> failwith "ExistsR" in
        let body' = subst [(x, t)] body in
        let suc_rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
        { sequent with succedent = body' :: (suc_rest @ [f]) }
    | _ -> failwith "Invalid quantifier rule"
  in
  let f_orig = match rule with ForallLeft(i, _) -> List.nth sequent.antecedent i | ExistsRight(i, _) -> List.nth sequent.succedent i | _ -> failwith "!" in
  match search stats depth term_limit ((f_orig, t) :: used) next_toggle current_depth s' with
  | Some tree -> 
      let final_rule = match rule with ForallLeft(i, _) -> ForallLeft(i, t) | ExistsRight(i, _) -> ExistsRight(i, t) | r -> r in
      Some (Inference (final_rule, sequent, [tree]))
  | None -> None

and find_all_tier2_rules sequent toggle =
  let scan_ant () =
    List.mapi (fun i f -> match f with
      | And _ -> Some (AndLeft i) | Iff _ -> Some (IffLeft i) | Not _ -> Some (NotLeft i)
      | Exists _ -> Some (ExistsLeft (i, "_")) | _ -> None
    ) sequent.antecedent |> List.filter_map (fun x -> x)
  in
  let scan_suc () =
    List.mapi (fun i f -> match f with
      | Or _ -> Some (OrRight i) | Implies _ -> Some (ImpliesRight i) | Not _ -> Some (NotRight i)
      | Forall _ -> Some (ForallRight (i, "_")) | _ -> None
    ) sequent.succedent |> List.filter_map (fun x -> x)
  in
  if toggle then scan_ant () @ scan_suc () else scan_suc () @ scan_ant ()

and find_all_tier3_rules sequent toggle =
  let scan_ant () =
    List.mapi (fun i f -> match f with
      | Or _ -> Some (OrLeft i) | Implies _ -> Some (ImpliesLeft i) | _ -> None
    ) sequent.antecedent |> List.filter_map (fun x -> x)
  in
  let scan_suc () =
    List.mapi (fun i f -> match f with
      | And _ -> Some (AndRight i) | Iff _ -> Some (IffRight i) | _ -> None
    ) sequent.succedent |> List.filter_map (fun x -> x)
  in
  if toggle then scan_ant () @ scan_suc () else scan_suc () @ scan_ant ()

and find_all_tier4_applications sequent term_limit used toggle =
  let funcs, bases = get_functions_and_base_terms sequent in
  let terms = enumerate_terms funcs bases term_limit in
  let scan_ant () =
    List.mapi (fun i f -> match f with
      | Forall _ ->
          List.filter_map (fun t -> if List.mem (f, t) used then None else Some (ForallLeft (i, Var "_"), t)) terms
      | _ -> []
    ) sequent.antecedent |> List.flatten
  in
  let scan_suc () =
    List.mapi (fun i f -> match f with
      | Exists _ ->
          List.filter_map (fun t -> if List.mem (f, t) used then None else Some (ExistsRight (i, Var "_"), t)) terms
      | _ -> []
    ) sequent.succedent |> List.flatten
  in
  if toggle then scan_ant () @ scan_suc () else scan_suc () @ scan_ant ()

and find_all_tier5_rules sequent toggle =
  let scan_ant () =
    List.mapi (fun i f -> match f with Forall _ -> Some (ForallLeft (i, Var "_")) | _ -> None) sequent.antecedent
    |> List.filter_map (fun x -> x)
  in
  let scan_suc () =
    List.mapi (fun i f -> match f with Exists _ -> Some (ExistsRight (i, Var "_")) | _ -> None) sequent.succedent
    |> List.filter_map (fun x -> x)
  in
  if toggle then scan_ant () @ scan_suc () else scan_suc () @ scan_ant ()

(* ================================================================ *)
(* MAIN ENTRY POINT                                                  *)
(* ================================================================ *)

let prove formula timeout_ms =
  let start_time = Unix.gettimeofday () in
  deadline := start_time +. timeout_ms /. 1000.;
  let stats = make_stats () in
  let sequent = { antecedent = []; succedent = [formula] } in
  let secs = max 1 (int_of_float (ceil (timeout_ms /. 1000.))) in
  let old_handler = Sys.signal Sys.sigalrm
    (Sys.Signal_handle (fun _ -> raise Timeout_exn)) in
  let _ = Unix.alarm secs in
  let result =
    try
      let rec iterative_deepening max_d term_d =
        let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
        if elapsed > timeout_ms then { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
        else
          match search stats max_d term_d [] true 0 sequent with
          | Some _ ->
            stats.time_ms <- (Unix.gettimeofday () -. start_time) *. 1000.;
            { engine = Baseline; solved = true; stats }
          | None ->
            if max_d < 20 then iterative_deepening (max_d + 1) term_d
            else if term_d < 3 then iterative_deepening 5 (term_d + 1)
            else { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
      in iterative_deepening 1 0
    with Timeout_exn ->
      let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
      { engine = Baseline; solved = false; stats = { stats with time_ms = elapsed } }
  in
  let _ = Unix.alarm 0 in
  Sys.set_signal Sys.sigalrm old_handler;
  result
