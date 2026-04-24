"""
benchmark.py — Benchmarking suite for the Baseline Prover.

Generates 150 FOL problems (85% valid, 15% invalid) and runs them 
through the BaselineProver, collecting performance metrics.
"""

import json
import random
import time
from typing import List, Tuple
from parser import parse_formula
from baseline import BaselineProver
from fol_types import Formula

# ================================================================
# PROBLEM GENERATORS
# ================================================================

def get_valid_templates() -> List[str]:
    """Return a list of valid FOL theorem templates."""
    return [
        # Propositional
        "(P -> Q) -> (~Q -> ~P)",
        "P | ~P",
        "((P -> Q) -> P) -> P",
        "(P & Q) -> P",
        "(P & Q) -> Q",
        "P -> (P | Q)",
        "Q -> (P | Q)",
        "(P & (P -> Q)) -> Q",
        "((P -> Q) & (Q -> R)) -> (P -> R)",
        "P <-> P",
        "(P <-> Q) <-> (Q <-> P)",
        
        # Quantifiers (Monadic)
        "(A.x (P(x) -> Q(x)) & P(a)) -> Q(a)",
        "(A.x (P(x) -> Q(x)) & ~Q(a)) -> ~P(a)",
        "(A.x P(x)) -> P(a)",
        "P(a) -> (E.x P(x))",
        "(A.x (P(x) & Q(x))) <-> (A.x P(x)) & (A.x Q(x))",
        "(E.x (P(x) | Q(x))) <-> (E.x P(x)) | (E.x Q(x))",
        "(A.x P(x)) | (E.x ~P(x))",
        "E.x (P(x) -> A.y P(y))", # Drinker's Paradox
        "A.x (P(x) -> Q(x)) & A.x (Q(x) -> R(x)) -> A.x (P(x) -> R(x))",
        "A.x P(x) -> E.x P(x)",
        
        # Quantifiers (Binary/Polyadic)
        "(A.x A.y P(x,y)) -> (A.y A.x P(x,y))",
        "(E.x E.y P(x,y)) -> (E.y E.x P(x,y))",
        "(E.x A.y P(x,y)) -> (A.y E.x P(x,y))",
        "A.x P(x,x) -> A.x E.y P(x,y)",
        "(A.x (P(x) -> E.y Q(x,y)) & A.x A.y (Q(x,y) -> R(y))) -> A.x (P(x) -> E.y R(y))",
        
        # Functions
        "A.x P(f(x)) -> E.y P(y)",
        "P(a) -> P(f(a)) | ~P(f(a))",
        "A.x (P(x) -> P(f(x))) & P(a) -> P(f(f(a)))"
    ]

def get_invalid_templates() -> List[str]:
    """Return a list of invalid FOL statement templates (non-theorems)."""
    return [
        # Propositional Fallacies
        "(P -> Q) -> (Q -> P)", # Affirming the consequent
        "(P -> Q) -> (~P -> ~Q)", # Denying the antecedent
        "P & ~P", # Contradiction
        "P | Q", # Random disjunction
        "~(P -> P)",
        
        # Quantifier Misuse
        "(A.x (P(x) | Q(x))) -> (A.x P(x)) | (A.x Q(x))",
        "(E.x P(x)) & (E.x Q(x)) -> (E.x (P(x) & Q(x)))",
        "(A.x E.y P(x,y)) -> (E.y A.x P(x,y))", # Classic swap fallacy
        "E.x P(x) -> A.x P(x)",
        "(A.x (P(x) -> Q(x)) & Q(a)) -> P(a)",
        "A.x (P(x) | ~P(f(x))) -> P(a)",
        "A.x P(x) -> P(f(x)) & P(g(x))", # Might be valid if domain restricted, but usually not
        "P(a) & ~P(b)"
    ]

def randomize_formula(template: str) -> str:
    """Randomize predicate and constant names in a template."""
    preds = ["A", "B", "C", "D", "P", "Q", "R", "S", "H", "G", "M", "K"]
    consts = ["a", "b", "c", "d", "e", "s", "t", "u"]
    funcs = ["f", "g", "h", "k"]
    
    # We use simple string replacement
    # Note: This is hacky but sufficient for benchmarking noise
    for i in range(1, 5):
        template = template.replace(f"P{i}", random.choice(preds))
        template = template.replace(f"Q{i}", random.choice(preds))
    
    # Basic replacements
    mapping = {
        "P": random.choice(preds),
        "Q": random.choice(preds),
        "R": random.choice(preds),
        "M": random.choice(preds),
        "a": random.choice(consts),
        "s": random.choice(consts),
        "f": random.choice(funcs),
        "g": random.choice(funcs)
    }
    
    res = template
    for old, new in mapping.items():
        res = res.replace(old, new)
    return res

def generate_suite(count: int = 150, valid_ratio: float = 0.85) -> List[Tuple[str, bool]]:
    valid_count = int(count * valid_ratio)
    invalid_count = count - valid_count
    
    valid_templates = get_valid_templates()
    invalid_templates = get_invalid_templates()
    
    suite = []
    
    for _ in range(valid_count):
        t = random.choice(valid_templates)
        suite.append((randomize_formula(t), True))
        
    for _ in range(invalid_count):
        t = random.choice(invalid_templates)
        suite.append((randomize_formula(t), False))
        
    random.shuffle(suite)
    return suite

# ================================================================
# RUNNER
# ================================================================

def run_benchmark():
    print("=== ATP Python Prototyping Benchmark ===")
    print("Generating 150 problems (85% valid, 15% invalid)...")
    suite = generate_suite(150, 0.85)
    
    prover = BaselineProver(timeout_ms=2000.0) # 2s timeout per problem
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
                print(f" Progress: {i}/150...")
                
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
