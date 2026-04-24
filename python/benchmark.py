"""
benchmark.py — Benchmarking suite for the Baseline Prover.

Features:
- Auto-generated problems (85% valid, 15% invalid) with noise.
- Pelletier's 75 Problems suite.
- Separated and aggregated statistics.
"""

import json
import random
import time
from typing import List, Tuple, Dict
from parser import parse_formula
from baseline import BaselineProver
from fol_types import Formula

# ================================================================
# AUTO-GENERATED PROBLEM TEMPLATES
# ================================================================

def get_valid_templates() -> List[str]:
    return [
        "(P -> Q) -> (~Q -> ~P)", "P | ~P", "((P -> Q) -> P) -> P",
        "(P & Q) -> P", "(P & Q) -> Q", "P -> (P | Q)", "Q -> (P | Q)",
        "(P & (P -> Q)) -> Q", "((P -> Q) & (Q -> R)) -> (P -> R)",
        "P <-> P", "(P <-> Q) <-> (Q <-> P)",
        "(A.x (P(x) -> Q(x)) & P(a)) -> Q(a)",
        "(A.x (P(x) -> Q(x)) & ~Q(a)) -> ~P(a)",
        "(A.x P(x)) -> P(a)", "P(a) -> (E.x P(x))",
        "(A.x (P(x) & Q(x))) <-> (A.x P(x)) & (A.x Q(x))",
        "(E.x (P(x) | Q(x))) <-> (E.x P(x)) | (E.x Q(x))",
        "(A.x P(x)) | (E.x ~P(x))", "E.x (P(x) -> A.y P(y))",
        "A.x (P(x) -> Q(x)) & A.x (Q(x) -> R(x)) -> A.x (P(x) -> R(x))",
        "A.x P(x) -> E.x P(x)", "(A.x A.y P(x,y)) -> (A.y A.x P(x,y))",
        "(E.x E.y P(x,y)) -> (E.y E.x P(x,y))", "(E.x A.y P(x,y)) -> (A.y E.x P(x,y))",
        "A.x P(x,x) -> A.x E.y P(x,y)", "A.x P(f(x)) -> E.y P(y)",
        "P(a) -> P(f(a)) | ~P(f(a))", "A.x (P(x) -> P(f(x))) & P(a) -> P(f(f(a)))"
    ]

def get_invalid_templates() -> List[str]:
    return [
        "(P -> Q) -> (Q -> P)", "(P -> Q) -> (~P -> ~Q)", "P & ~P", "P | Q", "~(P -> P)",
        "(A.x (P(x) | Q(x))) -> (A.x P(x)) | (A.x Q(x))",
        "(E.x P(x)) & (E.x Q(x)) -> (E.x (P(x) & Q(x)))",
        "(A.x E.y P(x,y)) -> (E.y A.x P(x,y))", "E.x P(x) -> A.x P(x)",
        "(A.x (P(x) -> Q(x)) & Q(a)) -> P(a)", "A.x (P(x) | ~P(f(x))) -> P(a)",
        "P(a) & ~P(b)"
    ]

def randomize_formula(template: str) -> str:
    preds = ["A", "B", "C", "D", "G", "H", "K", "L", "M", "N", "P", "Q", "R", "S"]
    consts = ["a", "b", "c", "d", "e", "s", "t", "u"]
    funcs = ["f", "g", "h", "k"]
    
    # Fix: Use random.sample to ensure distinct mappings
    sampled_preds = random.sample(preds, 6)
    sampled_consts = random.sample(consts, 4)
    sampled_funcs = random.sample(funcs, 3)
    
    mapping = {
        "P": sampled_preds[0], "Q": sampled_preds[1], "R": sampled_preds[2], 
        "S": sampled_preds[3], "M": sampled_preds[4], "G": sampled_preds[5],
        "a": sampled_consts[0], "b": sampled_consts[1], "c": sampled_consts[2], "s": sampled_consts[3],
        "f": sampled_funcs[0], "g": sampled_funcs[1], "h": sampled_funcs[2]
    }
    
    res = template
    for old, new in mapping.items():
        res = res.replace(old, new)
    return res

# ================================================================
# PELLETIER'S PROBLEMS
# ================================================================

def get_pelletier_problems() -> List[Dict]:
    """Selected Pelletier problems (1-46, excluding those needing identity)."""
    problems = [
        # Propositional (1-17)
        {"id": "P1", "f": "P -> Q <-> (~Q -> ~P)"},
        {"id": "P2", "f": "~~P <-> P"},
        {"id": "P3", "f": "~(P -> Q) -> (Q -> P)"},
        {"id": "P4", "f": "~P -> Q <-> ~Q -> P"},
        {"id": "P5", "f": "(P | Q -> P | R) -> (P | (Q -> R))"},
        {"id": "P6", "f": "P | ~P"},
        {"id": "P7", "f": "P | ~~P"},
        {"id": "P8", "f": "((P -> Q) -> P) -> P"}, # Peirce's Law
        {"id": "P9", "f": "((P | Q) & (~P | Q) & (P | ~Q)) -> ~(~P | ~Q)"},
        {"id": "P10", "f": "(Q -> R) & (R -> P & Q) & (P -> Q & R) -> (P <-> Q)"},
        {"id": "P11", "f": "P <-> P"},
        {"id": "P12", "f": "((P <-> Q) <-> R) <-> (P <-> (Q <-> R))"},
        {"id": "P13", "f": "P | (Q & R) <-> (P | Q) & (P | R)"},
        {"id": "P14", "f": "(P <-> Q) <-> (Q | ~P) & (~Q | P)"},
        {"id": "P15", "f": "P -> Q <-> ~P | Q"},
        {"id": "P16", "f": "(P -> Q) | (Q -> P)"},
        {"id": "P17", "f": "(P & (Q -> R) -> S) <-> (~P | Q | S) & (~P | ~R | S)"},
        
        # Monadic Predicate Logic (18-20)
        {"id": "P18", "f": "E.y A.x (P(y) -> P(x))"},
        {"id": "P19", "f": "E.x A.y A.z ((P(y) -> Q(z)) -> (P(x) -> Q(x)))"},
        {"id": "P20", "f": "(A.x A.y (E.z (P(x) & Q(y) -> R(z)))) -> (A.x A.y (P(x) & Q(y) -> (E.z R(z))))"},
        
        # Full FOL without Identity (21-34)
        {"id": "P21", "f": "(E.x (P -> Q(x))) & (E.x (Q(x) -> P)) -> (E.x (P <-> Q(x)))"},
        {"id": "P22", "f": "A.x (P <-> Q(x)) -> (P <-> A.x Q(x))"},
        {"id": "P23", "f": "A.x (P | Q(x)) <-> P | A.x Q(x)"},
        {"id": "P24", "f": "~(E.x (P(x) & Q(x))) & (A.x (P(x) -> R(x))) & (E.x (Q(x) & ~R(x))) -> (E.x (Q(x) & ~P(x)))"},
        {"id": "P25", "f": "(E.x P(x)) & (A.x (G(x) -> ~P(x))) & (A.x (P(x) -> (H(x) | G(x)))) & (A.x (P(x) -> ~H(x))) -> (A.x (P(x) -> G(x)))"}, # Invalid but good test
        {"id": "P26", "f": "(E.x P(x) <-> E.y Q(y)) & (A.x A.y (P(x) & Q(y) -> (R(x) <-> S(y)))) -> (A.x (P(x) -> R(x)) <-> A.y (Q(y) -> S(y)))"},
        {"id": "P27", "f": "(E.x P(x) & ~A.x Q(x)) & (A.x (P(x) -> R(x))) -> E.x (R(x) & ~Q(x))"},
        {"id": "P28", "f": "(A.x P(x) -> A.x Q(x)) & (A.x (Q(x) -> R(x))) -> (A.x (P(x) -> R(x)))"},
        {"id": "P29", "f": "(E.x P(x)) & (E.y Q(y)) -> ((A.x (P(x) -> R(x))) & (A.y (Q(y) -> S(y))) <-> (A.x A.y (P(x) & Q(y) -> R(x) & S(y))))"},
        {"id": "P30", "f": "A.x (P(x) | Q(x) -> ~R(x)) & A.x ((Q(x) -> ~S(x)) -> P(x) & R(x)) -> A.x S(x)"},
        {"id": "P31", "f": "~(E.x (P(x) & (G(x) | H(x)))) & (E.x (I(x) & P(x))) & (A.x (~H(x) -> J(x))) -> E.x (I(x) & J(x))"},
        {"id": "P32", "f": "A.x (P(x) & (Q(x) | R(x)) -> S(x)) & A.x (S(x) & R(x) -> L(x)) & A.x (M(x) -> R(x)) -> A.x (P(x) & M(x) -> L(x))"},
        {"id": "P33", "f": "A.x (P(a) & (P(x) -> P(b)) -> P(c)) <-> A.x ((~P(a) | P(x) | P(c)) & (~P(a) | ~P(b) | P(c)))"},
        {"id": "P34", "f": "((E.x A.y (P(x) <-> P(y))) <-> ((E.x Q(x)) <-> (A.y P(y)))) <-> ((E.x A.y (Q(x) <-> Q(y))) <-> ((E.x P(x)) <-> (A.y Q(y))))"}, # Andrews Challenge
        
        # P43 (Monadic logic problem)
        {"id": "P43", "f": "A.x A.y (Q(x,y) <-> A.z (P(z,x) <-> P(z,y))) -> A.x A.y (Q(x,y) <-> Q(y,x))"}
    ]
    return problems

# ================================================================
# RUNNER
# ================================================================

def run_suite(prover, suite, name):
    print(f"\n--- Running {name} ---")
    results = []
    solved = 0
    timeouts = 0
    soundness_fail = 0
    start_time = time.time()
    
    for i, p in enumerate(suite, 1):
        f_str = p['f']
        expected_valid = p.get('valid', True)
        try:
            f = parse_formula(f_str)
            success, tree, stats = prover.prove(f)
            
            status = "TIMEOUT"
            if success:
                status = "PROVED"
                if expected_valid: solved += 1
                else: soundness_fail += 1
            else:
                timeouts += 1
            
            results.append({
                "id": p.get('id', i),
                "formula": f_str,
                "expected_valid": expected_valid,
                "success": success,
                "status": status,
                "time_ms": stats.get("time_ms", 0)
            })
            
            if i % 20 == 0:
                print(f" Progress: {i}/{len(suite)}...")
        except Exception as e:
            results.append({"id": p.get('id', i), "formula": f_str, "error": str(e)})

    elapsed = time.time() - start_time
    return results, solved, timeouts, soundness_fail, elapsed

def run_benchmark():
    print("=== ATP-OCaml Python Prototyping Benchmark ===")
    prover = BaselineProver(timeout_ms=1000.0) # 1s timeout per problem for speed
    
    # 1. Generate Auto Suite
    auto_suite = []
    valid_templates = get_valid_templates()
    invalid_templates = get_invalid_templates()
    for _ in range(127):
        auto_suite.append({'f': randomize_formula(random.choice(valid_templates)), 'valid': True})
    for _ in range(23):
        auto_suite.append({'f': randomize_formula(random.choice(invalid_templates)), 'valid': False})
    random.shuffle(auto_suite)
    
    # 2. Get Pelletier Suite
    pel_suite = [{"f": p['f'], "id": p['id'], "valid": True} for p in get_pelletier_problems()]

    # Run
    res_auto, solved_auto, to_auto, sound_auto, time_auto = run_suite(prover, auto_suite, "Auto-Generated Suite")
    res_pel, solved_pel, to_pel, sound_pel, time_pel = run_suite(prover, pel_suite, "Pelletier Suite")
    
    # Combined
    total_problems = len(auto_suite) + len(pel_suite)
    total_solved = solved_auto + solved_pel
    
    print("\n" + "="*40)
    print("FINAL BENCHMARK REPORT")
    print("="*40)
    print(f"1. AUTO-GENERATED (N=150)")
    print(f"   Solved Valid: {solved_auto}/127 ({solved_auto/127*100:.1f}%)")
    print(f"   Soundness:    {'PASS' if sound_auto == 0 else 'FAIL'} ({sound_auto} invalid proved)")
    print(f"   Timeouts:     {to_auto}")
    print(f"   Total Time:   {time_auto:.2f}s")
    
    print(f"\n2. PELLETIER 75 (Selected N={len(pel_suite)})")
    print(f"   Solved:       {solved_pel}/{len(pel_suite)} ({solved_pel/len(pel_suite)*100:.1f}%)")
    print(f"   Timeouts:     {to_pel}")
    print(f"   Total Time:   {time_pel:.2f}s")
    
    print(f"\n3. AGGREGATED SCORE")
    print(f"   Overall %:    {total_solved/total_problems*100:.1f}% ({total_solved}/{total_problems})")
    print("="*40)
    
    # Save results
    all_results = {"auto": res_auto, "pelletier": res_pel}
    with open("benchmark_results.json", "w") as f:
        json.dump(all_results, f, indent=2)

if __name__ == "__main__":
    run_benchmark()
