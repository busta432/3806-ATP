import time
import json
from parser import parse_formula
from baseline import BaselineProver
from improved import ImprovedProver
from resolution import ResolutionProver

def get_suite():
    # 16 Valid, 4 Invalid (80% / 20%)
    suite = [
        # Valid (16)
        ("A.x R(x) -> R(a)", True),
        ("R(a) -> E.x R(x)", True),
        ("~A.x R(x) -> E.x ~R(x)", True),
        ("A.x (R(x) -> S(x)) -> (A.x R(x) -> A.x S(x))", True),
        ("E.x A.y R(x,y) -> A.y E.x R(x,y)", True),
        ("A.x (R(x) -> S(x)) -> (E.x R(x) -> E.x S(x))", True),
        ("A.x (R(x) -> R(x))", True),
        ("A.x R(x) -> E.x R(x)", True),
        ("(A.x R(x) & A.x S(x)) -> A.x (R(x) & S(x))", True),
        ("A.x R(f(x)) -> E.y R(y)", True),
        ("P -> Q <-> (~Q -> ~P)", True),
        ("~~P <-> P", True),
        ("E.y A.x (P(y) -> P(x))", True),
        ("A.x (P <-> Q(x)) -> (P <-> A.x Q(x))", True),
        ("E.x E.y R(x,y) -> E.y E.x R(x,y)", True),
        ("A.x R(x) -> (A.x S(x) -> A.x (R(x) & S(x)))", True),
        # Invalid (4)
        ("E.x R(x) -> A.x R(x)", False),
        ("A.x E.y R(x,y) -> E.y A.x R(x,y)", False),
        ("R(f(a)) -> R(a)", False),
        ("E.x (R(x) -> S(x)) -> (E.x R(x) -> E.x S(x))", False)
    ]
    return suite

def run_tests():
    suite = get_suite()
    print(f"Running Evaluation on {len(suite)} problems (16 Valid, 4 Invalid)...\n")
    
    results = {}
    for name in ["Baseline", "Improved", "Resolution"]:
        results[name] = {"solved": 0, "total": len(suite), "time_ms": 0.0, "steps": 0, "max_depth": 0,
                         "inst_attempts": 0, "inst_hits": 0, "inst_wasted": 0, 
                         "clauses_gen": 0, "subsumptions": 0}

    for i, (f_str, expected) in enumerate(suite):
        try:
            f = parse_formula(f_str)
            
            # 1. Baseline
            b = BaselineProver(timeout_ms=2000)
            succ, tree, stats = b.prove(f)
            if succ == expected: results["Baseline"]["solved"] += 1
            results["Baseline"]["time_ms"] += stats.get("time_ms", 0.0)
            results["Baseline"]["steps"] += stats.get("steps", 0)
            results["Baseline"]["max_depth"] = max(results["Baseline"]["max_depth"], stats.get("max_depth", 0))
            
            # 2. Improved
            imp = ImprovedProver(timeout_ms=2000)
            succ, stats = imp.prove(f)
            if succ == expected: results["Improved"]["solved"] += 1
            results["Improved"]["time_ms"] += stats.get("time_ms", 0.0)
            results["Improved"]["steps"] += stats.get("steps", 0)
            results["Improved"]["max_depth"] = max(results["Improved"]["max_depth"], stats.get("max_depth", 0))

            # 3. Resolution
            res_prov = ResolutionProver(timeout_ms=2000)
            succ, stats = res_prov.prove(f)
            if succ == expected: results["Resolution"]["solved"] += 1
            results["Resolution"]["time_ms"] += stats.get("time_ms", 0.0)
            results["Resolution"]["steps"] += stats.get("steps", 0)
            results["Resolution"]["clauses_gen"] += stats.get("clauses_gen", 0)
            results["Resolution"]["subsumptions"] += stats.get("subsumptions", 0)
        except Exception as e:
            print(f"Error on problem {i+1}: {e}")

    print("="*110)
    print(f"{'Engine':<12} | {'Solve %':<7} | {'Time(s)':<8} | {'Steps':<6} | {'Depth':<5} | {'InstAtt':<7} | {'InstHit%':<8} | {'InstWst':<7} | {'ClsGen':<7} | {'Subsump':<7}")
    print("-" * 110)
    
    for name, r in results.items():
        solve_rate = (r["solved"] / r["total"]) * 100
        time_sec = r["time_ms"] / 1000.0
        
        inst_att = "N/A"
        inst_hit = "N/A"
        inst_wst = "N/A"
        
        cls_gen = r["clauses_gen"] if name == "Resolution" else "N/A"
        subs = r["subsumptions"] if name == "Resolution" else "N/A"
        
        print(f"{name:<12} | {solve_rate:>6.1f}% | {time_sec:>8.3f} | {r['steps']:>6} | {r['max_depth']:>5} | {inst_att:>7} | {inst_hit:>8} | {inst_wst:>7} | {cls_gen:>7} | {subs:>7}")

if __name__ == "__main__":
    run_tests()
