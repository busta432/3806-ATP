(** improved.ml — ENGINE 2: Improved LK' Prover.
    
    This engine improves upon the baseline by using:
    - Invertible-First Rule Ordering (I2): Greedily apply rules that don't split the proof search space.
    - Unification-Guided Instantiation (I4): Use metavariables and solve for them at the identity axioms.
    - Iterative Deepening (I1): Bound the number of quantifier instantiations.
    - Loop Detection (I3): Prune redundant branches by tracking sequent history.
    
    Reference:
    - Harrison (2009), Handbook of Practical Logic and Automated Reasoning. *)

open Types
open Formula
open Unification

(* ================================================================ *)
(* METAVARIABLE HANDLING                                             *)
(* ================================================================ *)

let is_metavar v = String.length v > 0 && v.[0] = '?'

let fresh_metavar n = ("?" ^ string_of_int n), n + 1

(* ================================================================ *)
(* RULE CLASSIFICATION                                              *)
(* ================================================================ *)

type rule_category =
  | Invertible        (** Rules that preserve provability and don't branch (or branch but are safe) *)
  | Branching         (** Rules that split the search space (AndRight, OrLeft, ImpliesLeft) *)
  | Instantiation     (** Quantifier rules (ForallLeft, ExistsRight) *)

let classify_rule = function
  | AndLeft _ | OrRight _ | ImpliesRight _ | NotLeft _ | NotRight _ 
  | ForallRight _ | ExistsLeft _ -> Invertible
  | AndRight _ | OrLeft _ | ImpliesLeft _ -> Branching
  | ForallLeft _ | ExistsRight _ -> Instantiation
  | _ -> failwith "Internal error: Non-search rule in classification"

(* ================================================================ *)
(* LOOP DETECTION (I3)                                              *)
(* ================================================================ *)

let formula_list_equal l1 l2 =
  List.length l1 = List.length l2 &&
  List.for_all (fun f1 -> List.exists (fun f2 -> formula_equal f1 f2) l2) l1

let sequent_equal s1 s2 =
  formula_list_equal s1.antecedent s2.antecedent &&
  formula_list_equal s1.succedent s2.succedent

(* ================================================================ *)
(* PROOF SEARCH CORE                                                 *)
(* ================================================================ *)

(** Attempt to close a branch by finding an identity axiom A ⊢ A' 
    where A and A' are unifiable under the current substitution. *)
let find_identity sigma antecedent succedent =
  let rec try_pairs = function
    | [] -> None
    | (a, s) :: rest ->
      match (a, s) with
      | Pred(p1, args1), Pred(p2, args2) when p1 = p2 ->
        if List.length args1 <> List.length args2 then try_pairs rest
        else
          (match unify sigma (List.combine args1 args2) with
           | Some subst' -> Some subst'
           | None -> try_pairs rest)
      | _ -> 
        if formula_equal a s then Some sigma
        else try_pairs rest
  in
  let pairs = List.concat_map (fun a -> List.map (fun s -> (a, s)) succedent) antecedent in
  try_pairs pairs

(** Main search function. *)
let rec search stats depth_limit sigma metavars history sequent =
  stats.steps <- stats.steps + 1;
  stats.max_depth <- max (stats.max_depth) (30 - depth_limit); (* Relative depth tracking *)

  if depth_limit < 0 then None
  else if List.exists (fun s -> sequent_equal s sequent) history then None (* Loop Detection *)
  else
  (* 1. Axiom Checks *)
  if List.mem Top sequent.succedent || List.mem Bot sequent.antecedent then
    Some (sigma, metavars)
  else
    match find_identity sigma sequent.antecedent sequent.succedent with
    | Some subst' -> Some (subst', metavars)
    | None ->
      if depth_limit = 0 then None
      else
      (* 2. Rule Selection *)
      let rec try_rules = function
        | [] -> None
        | rule :: rest ->
          match apply_and_search stats (depth_limit - 1) sigma metavars (sequent :: history) sequent rule with
          | Some res -> Some res
          | None -> try_rules rest
      in
      
      (* Prioritize Invertible -> Branching -> Instantiation *)
      match find_all_rules sequent with
      | inv, [], [] when inv <> [] -> try_rules inv  (* Phase A: Only invertible *)
      | inv, br, inst -> 
        let all = inv @ br @ inst in
        try_rules all

and find_all_rules sequent =
  (* Correct classification based on LK' properties:
     Invertible: AndLeft, OrRight, ImpliesRight, NotLeft, NotRight, ForallRight, ExistsLeft, IffRight. *)
  let inv_l, br_l, inst_l = collect_left_rules 0 sequent.antecedent in
  let inv_r, br_r, inst_r = collect_right_rules 0 sequent.succedent in
  (inv_l @ inv_r), (br_l @ br_r), (inst_l @ inst_r)

and collect_left_rules i = function
  | [] -> [], [], []
  | f :: fs ->
    let inv, br, inst = collect_left_rules (i+1) fs in
    match f with
    | And _ -> (AndLeft i :: inv), br, inst
    | Or _ -> inv, (OrLeft i :: br), inst
    | Implies _ -> inv, (ImpliesLeft i :: br), inst
    | Iff _ -> (IffLeft i :: inv), br, inst
    | Not _ -> (NotLeft i :: inv), br, inst
    | Exists(x, _) -> (ExistsLeft (i, x) :: inv), br, inst
    | Forall(x, _) -> inv, br, (ForallLeft (i, Var x) :: inst)
    | _ -> inv, br, inst

and collect_right_rules i = function
  | [] -> [], [], []
  | f :: fs ->
    let inv, br, inst = collect_right_rules (i+1) fs in
    match f with
    | And _ -> inv, (AndRight i :: br), inst
    | Or _ -> (OrRight i :: inv), br, inst
    | Implies _ -> (ImpliesRight i :: inv), br, inst
    | Iff _ -> inv, (IffRight i :: br), inst
    | Not _ -> (NotRight i :: inv), br, inst
    | Forall(x, _) -> (ForallRight (i, x) :: inv), br, inst
    | Exists(x, _) -> inv, br, (ExistsRight (i, Var x) :: inst)
    | _ -> inv, br, inst

and apply_and_search stats depth_limit sigma metavars history sequent rule =
  match rule with
  | AndLeft i ->
    let a, b = match List.nth sequent.antecedent i with And(a,b) -> a,b | _ -> failwith "AndL" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    search stats depth_limit sigma metavars history { sequent with antecedent = a :: b :: ant' }

  | OrRight i ->
    let a, b = match List.nth sequent.succedent i with Or(a,b) -> a,b | _ -> failwith "OrR" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    search stats depth_limit sigma metavars history { sequent with succedent = a :: b :: suc' }

  | ImpliesRight i ->
    let a, b = match List.nth sequent.succedent i with Implies(a,b) -> a,b | _ -> failwith "ImpR" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    search stats depth_limit sigma metavars history { antecedent = a :: sequent.antecedent; succedent = b :: suc' }

  | NotLeft i ->
    let a = match List.nth sequent.antecedent i with Not a -> a | _ -> failwith "NotL" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    search stats depth_limit sigma metavars history { antecedent = ant'; succedent = a :: sequent.succedent }

  | NotRight i ->
    let a = match List.nth sequent.succedent i with Not a -> a | _ -> failwith "NotR" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    search stats depth_limit sigma metavars history { antecedent = a :: sequent.antecedent; succedent = suc' }

  | IffLeft i ->
    let a, b = match List.nth sequent.antecedent i with Iff(a,b) -> a,b | _ -> failwith "IffL" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    search stats depth_limit sigma metavars history { sequent with antecedent = Implies(a,b) :: Implies(b,a) :: ant' }

  | IffRight i ->
    let a, b = match List.nth sequent.succedent i with Iff(a,b) -> a,b | _ -> failwith "IffR" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    (match search stats depth_limit sigma metavars history { sequent with succedent = Implies(a,b) :: suc' } with
     | None -> None
     | Some (subst', m') ->
       search stats depth_limit subst' m' history { sequent with succedent = Implies(b,a) :: suc' })

  | ExistsLeft (i, _) ->
    let x, body = match List.nth sequent.antecedent i with
      | Exists(x, b) -> x, b
      | _ -> failwith "EigenR Left"
    in
    let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
    let x' = variant x avoid in
    let body' = subst [(x, Var x')] body in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    search stats depth_limit sigma metavars history { sequent with antecedent = body' :: ant' }

  | ForallRight (i, _) ->
    let x, body = match List.nth sequent.succedent i with
      | Forall(x, b) -> x, b
      | _ -> failwith "EigenR Right"
    in
    let avoid = List.concat_map free_vars (sequent.antecedent @ sequent.succedent) in
    let x' = variant x avoid in
    let body' = subst [(x, Var x')] body in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    search stats depth_limit sigma metavars history { sequent with succedent = body' :: suc' }

  | AndRight i ->
    let a, b = match List.nth sequent.succedent i with And(a,b) -> a,b | _ -> failwith "AndR" in
    let suc' = List.filteri (fun j _ -> i <> j) sequent.succedent in
    (match search stats depth_limit sigma metavars history { sequent with succedent = a :: suc' } with
     | None -> None
     | Some (subst', m') ->
       search stats depth_limit subst' m' history { sequent with succedent = b :: suc' })

  | OrLeft i ->
    let a, b = match List.nth sequent.antecedent i with Or(a,b) -> a,b | _ -> failwith "OrL" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    (match search stats depth_limit sigma metavars history { sequent with antecedent = a :: ant' } with
     | None -> None
     | Some (subst', m') ->
       search stats depth_limit subst' m' history { sequent with antecedent = b :: ant' })

  | ImpliesLeft i ->
    let a, b = match List.nth sequent.antecedent i with Implies(a,b) -> a,b | _ -> failwith "ImpL" in
    let ant' = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    (match search stats depth_limit sigma metavars history { antecedent = ant'; succedent = a :: sequent.succedent } with
     | None -> None
     | Some (subst', m') ->
       search stats depth_limit subst' m' history { sequent with antecedent = b :: ant' })


  | ForallLeft (i, _) ->
    let x, body = match List.nth sequent.antecedent i with Forall(x,b) -> x,b | _ -> failwith "ForallL" in
    let m_name, m_next = fresh_metavar metavars in
    let body' = subst [(x, Var m_name)] body in
    let ant_rest = List.filteri (fun j _ -> i <> j) sequent.antecedent in
    search stats depth_limit sigma m_next history { sequent with antecedent = body' :: (ant_rest @ [Forall(x, body)]) }

  | ExistsRight (i, _) ->
    let x, body = match List.nth sequent.succedent i with Exists(x,b) -> x,b | _ -> failwith "ExistsR" in
    let m_name, m_next = fresh_metavar metavars in
    let body' = subst [(x, Var m_name)] body in
    let suc_rest = List.filteri (fun j _ -> i <> j) sequent.succedent in
    search stats depth_limit sigma m_next history { sequent with succedent = body' :: (suc_rest @ [Exists(x, body)]) }

  | _ -> None

(* ================================================================ *)
(* MAIN ENTRY POINT                                                  *)
(* ================================================================ *)

let prove formula timeout_ms =
  let start_time = Unix.gettimeofday () in
  let stats = make_stats () in
  let sequent = { antecedent = []; succedent = [formula] } in
  
  let rec iterative_deepening limit =
    let elapsed = (Unix.gettimeofday () -. start_time) *. 1000. in
    if elapsed > timeout_ms then
      { engine = Improved; solved = false; stats = { stats with time_ms = elapsed } }
    else
      match search stats limit [] 0 [] sequent with
      | Some (_, _) ->
        let end_time = Unix.gettimeofday () in
        stats.time_ms <- (end_time -. start_time) *. 1000.;
        { engine = Improved; solved = true; stats }
      | None ->
        if limit < 30 then iterative_deepening (limit + 1)
        else { engine = Improved; solved = false; stats = { stats with time_ms = elapsed } }
  in
  iterative_deepening 1
