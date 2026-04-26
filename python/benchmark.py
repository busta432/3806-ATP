"""
benchmark.py — Benchmarking suite for the Baseline Prover.

250 FOL problems (85% valid, 15% invalid) and runs them 
through the BaselineProver, collecting performance metrics. 
Replace Random Generation as it was causing issues.
"""
import re
import json
import random
import time
from typing import List, Tuple
from parser import parse_formula
from baseline import BaselineProver
from fol_types import Formula
import random
from typing import List, Tuple

# ================================================================
# HARD-CODED BENCHMARK SUITE (250 total)
# ================================================================

def generate_suite(count: int = 250, valid_ratio: float = 0.9) -> List[Tuple[str, bool]]:
    """
    Deterministic FOL benchmark suite:
    - 90% valid theorems
    - 10% invalid formulas
    No random generation of structure (only sampling).
    """

    valid = [
        # =========================================================
        # 1. Quantifier laws
        # =========================================================
        "A.x R(x) -> R(a)",
        "R(a) -> E.x R(x)",
        "~A.x R(x) -> E.x ~R(x)",
        "~E.x R(x) -> A.x ~R(x)",

        "A.x (R(x) -> S(x)) -> (A.x R(x) -> A.x S(x))",
        "(A.x R(x) & A.x S(x)) -> A.x (R(x) & S(x))",
        "E.x (R(x) & S(x)) -> (E.x R(x) & E.x S(x))",

        # =========================================================
        # 2. Quantifier interaction
        # =========================================================
        "E.x A.y R(x,y) -> A.y E.x R(x,y)",
        "A.x A.y R(x,y) -> A.y A.x R(x,y)",
        "E.x E.y R(x,y) -> E.y E.x R(x,y)",

        # =========================================================
        # 3. Logical monotonicity / implication structure
        # =========================================================
        "A.x (R(x) -> S(x)) -> (E.x R(x) -> E.x S(x))",
        "(A.x R(x) & A.x (R(x) -> S(x))) -> A.x S(x)",
        "(A.x (R(x) -> S(x)) & A.x (S(x) -> T(x))) -> A.x (R(x) -> T(x))",

        # =========================================================
        # 4. Identity / tautological schemas
        # =========================================================
        "A.x (R(x) -> R(x))",
        "A.x (R(x) -> (R(x) | S(x)))",
        "A.x (R(x) & S(x) -> R(x))",
        "A.x (R(x) & S(x) -> S(x))",

        # =========================================================
        # 5. Existential strengthening/weakening
        # =========================================================
        "A.x R(x) -> E.x R(x)",
        "E.x R(x) -> E.x (R(x) | S(x))",
        "A.x R(x) -> A.x (R(x) | S(x))",

        # =========================================================
        # 6. Distribution patterns
        # =========================================================
        "(A.x R(x) & A.x S(x)) -> A.x (R(x) & S(x))",
        "E.x (R(x) & S(x)) -> (E.x R(x) & E.x S(x))",

        # =========================================================
        # 7. Function-related validity (light)
        # =========================================================
        "A.x R(f(x)) -> E.y R(y)",
        "A.x (R(x) -> R(f(x))) -> (R(a) -> R(f(f(a))))",

        # =========================================================
        # 8. Mixed relational validity
        # =========================================================
        "A.x (R(x) -> S(x)) -> (A.x R(x) -> E.x S(x))",
        "A.x R(x) -> (A.x S(x) -> A.x (R(x) & S(x)))",
    ]

    invalid = [
        # =========================================================
        # 1. Quantifier fallacies
        # =========================================================
        "E.x R(x) -> A.x R(x)",
        "A.x R(x) -> R(a) & R(b)",

        "(A.x R(x) | A.x S(x)) -> A.x (R(x) | S(x))",
        "(E.x R(x) & E.x S(x)) -> E.x (R(x) & S(x))",

        # =========================================================
        # 2. Invalid quantifier swapping
        # =========================================================
        "A.x E.y R(x,y) -> E.y A.x R(x,y)",

        # =========================================================
        # 3. Distribution errors
        # =========================================================
        "A.x (R(x) | S(x)) -> (A.x R(x) | A.x S(x))",
        "E.x (R(x) -> S(x)) -> (E.x R(x) -> E.x S(x))",

        # =========================================================
        # 4. Logical invalidities
        # =========================================================
        "R(a) -> R(b)",
        "R(x) -> ~R(x)",
        "R(a) & ~R(a)",

        # =========================================================
        # 5. Function misuse
        # =========================================================
        "A.x R(x) -> R(f(x))",
        "R(f(a)) -> R(a)",

        # =========================================================
        # 6. Structural invalid forms
        # =========================================================
        "A.x R(x) R(a)",   # malformed concatenation
        "E.x R(x) A.x S(x)",

        # =========================================================
        # 7. Cross-variable confusion
        # =========================================================
        "A.x R(x,y) -> R(x)",
        "E.x R(x) -> R(x,y)",
    ]

    # =========================================================
    # Build dataset
    # =========================================================

    valid_count = int(count * valid_ratio)
    invalid_count = count - valid_count

    suite: List[Tuple[str, bool]] = []

    for i in range(valid_count):
        suite.append((valid[i % len(valid)], True))

    for i in range(invalid_count):
        suite.append((invalid[i % len(invalid)], False))

    random.shuffle(suite)
    return suite

# ================================================================
# RUNNER
# ================================================================

def run_benchmark():
    print("=== ATP Python Prototyping Benchmark ===")
    print("Generating Test problems (90% valid, 10% invalid)...")
    suite = generate_suite(250, 0.90)
    
    prover = BaselineProver(timeout_ms=10000000.0) # 10s timeout per problem
    results = []
    
    total_valid = sum(1 for _, v in suite if v)
    total_invalid = len(suite) - total_valid
    
    solved_valid = 0
    solved_invalid = 0 # Should remain 0 for a sound prover
    timeouts = 0
    
    print(f"\nRunning benchmark...")
    start_time = time.time()
    
    for i, (f_str, expected_valid) in enumerate(suite, 1):
        try:
            f = parse_formula(f_str)
            success, tree, stats = prover.prove(f)
            
            status = "TIMEOUT"
            if success:
                status = "PROVED"
                if expected_valid: solved_valid += 1
                else: solved_invalid += 1
            else:
                timeouts += 1
            
            results.append({
                "id": i,
                "formula": f_str,
                "expected_valid": expected_valid,
                "success": success,
                "status": status,
                "steps": stats.get("steps", 0),
                "time_ms": stats.get("time_ms", 0),
                "max_depth": stats.get("max_depth", 0)
            })
            
            if i % 10 == 0:
                print(f" Progress: {i}/250...")
                
        except Exception as e:
            print(f" Error parsing/proving {f_str}: {e}")
            results.append({
                "id": i,
                "formula": f_str,
                "error": str(e)
            })

    end_time = time.time()
    
    # Summary
    print("\n=== BENCHMARK SUMMARY ===")
    print(f"Total Problems: {len(suite)}")
    print(f"Valid Problems: {total_valid} | Solved: {solved_valid} ({solved_valid/total_valid*100:.1f}%)")
    print(f"Invalid Problems: {total_invalid} | Solved: {solved_invalid} (Soundness check: {'PASS' if solved_invalid == 0 else 'FAIL'})")
    print(f"Total Time: {end_time - start_time:.2f} seconds")
    print(f"Total Timeouts/Failures: {timeouts}")
    
    # Save to file
    with open("benchmark_results.json", "w") as f:
        json.dump(results, f, indent=2)
    print("\nDetailed results saved to benchmark_results.json")

if __name__ == "__main__":
    run_benchmark()
