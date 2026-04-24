"""
baseline.py — ENGINE 1: Baseline LK' Backward Search (Algorithm 2).

Faithful implementation of Algorithm 2 from Zhe Hou's textbook.
Performs a goal-directed backward search in the LK' sequent calculus.
To handle quantifiers naively but completely, it uses a depth-limited
search with a growing Herbrand universe (iterative deepening).

Reference:
  - Hou (2021), Fundamentals of Logic and Computation, p. 67.
"""

import time
import itertools
from typing import Optional, Set, List, Tuple
from fol_types import (
    Term, Variable, Constant, Function,
    Formula, Atom, Negation, BinaryOp, Connective,
    QuantifiedFormula, Quantifier,
    Sequent, DerivationTree, FreshTermGenerator
)

class BaselineProver:
    def __init__(self, timeout_ms: float = 5000.0):
        self.timeout_ms = timeout_ms
        self.start_time = 0.0
        self.steps = 0
        self.max_depth_reached = 0
        self.fresh_gen = FreshTermGenerator()

    def _check_timeout(self) -> bool:
        elapsed = (time.time() - self.start_time) * 1000.0
        return elapsed > self.timeout_ms

    def prove(self, formula: Formula) -> Tuple[bool, Optional[DerivationTree], dict]:
        self.start_time = time.time()
        self.steps = 0
        self.max_depth_reached = 0
        self.fresh_gen.reset()

        initial_sequent = Sequent(antecedent=[], succedent=[formula])
        
        # Iterative deepening over tree depth and term depth
        # Faithful to OCaml: max_d up to 20, term_d up to 3
        for term_d in range(4):
            for max_d in range(1, 21):
                if self._check_timeout():
                    break
                
                res = self._search(initial_sequent, max_d, term_d)
                if res:
                    elapsed = (time.time() - self.start_time) * 1000.0
                    stats = {
                        "steps": self.steps,
                        "max_depth": self.max_depth_reached,
                        "time_ms": elapsed,
                        "term_depth": term_d
                    }
                    return True, res, stats
            
            if self._check_timeout():
                break

        elapsed = (time.time() - self.start_time) * 1000.0
        stats = {
            "steps": self.steps,
            "max_depth": self.max_depth_reached,
            "time_ms": elapsed
        }
        return False, None, stats

    def _search(self, sequent: Sequent, max_depth: int, term_depth: int) -> Optional[DerivationTree]:
        self.steps += 1
        # Track relative depth reached
        self.max_depth_reached = max(self.max_depth_reached, 20 - max_depth)

        if self._check_timeout():
            return None

        # 1. Axiom check (Tier 1)
        if any(isinstance(f, Atom) and f.predicate == "⊤" for f in sequent.succedent):
            return DerivationTree(sequent, rule_applied="⊤R")
        if any(isinstance(f, Atom) and f.predicate == "⊥" for f in sequent.antecedent):
            return DerivationTree(sequent, rule_applied="⊥L")
        
        # Identity axiom: same formula on both sides
        for a in sequent.antecedent:
            for s in sequent.succedent:
                if a == s:
                    return DerivationTree(sequent, rule_applied="id")

        if max_depth <= 0:
            return None

        # 2. Rule selection (Algorithm 2 Greedy Scan)
        # Scan antecedent then succedent for the first applicable logical connective.
        rule = self._find_first_applicable_rule(sequent)
        if rule:
            rule_name, idx, side = rule
            if rule_name in ("∀L", "∃R"):
                return self._apply_quantifier_rule(sequent, rule_name, idx, side, max_depth, term_depth)
            else:
                return self._apply_rule(sequent, rule_name, idx, side, max_depth, term_depth)

        return None

    def _find_first_applicable_rule(self, sequent: Sequent) -> Optional[Tuple[str, int, str]]:
        """Greedy scan for the first formula that isn't an atom."""
        # Scan Antecedent
        for i, f in enumerate(sequent.antecedent):
            if isinstance(f, BinaryOp):
                if f.connective == Connective.AND: return "∧L", i, "L"
                if f.connective == Connective.OR:  return "∨L", i, "L"
                if f.connective == Connective.IMPLIES: return "→L", i, "L"
                if f.connective == Connective.IFF: return "↔L", i, "L"
            if isinstance(f, Negation): return "¬L", i, "L"
            if isinstance(f, QuantifiedFormula):
                if f.quantifier == Quantifier.FORALL: return "∀L", i, "L"
                if f.quantifier == Quantifier.EXISTS: return "∃L", i, "L"
        
        # Scan Succedent
        for i, f in enumerate(sequent.succedent):
            if isinstance(f, BinaryOp):
                if f.connective == Connective.AND: return "∧R", i, "R"
                if f.connective == Connective.OR:  return "∨R", i, "R"
                if f.connective == Connective.IMPLIES: return "→R", i, "R"
                if f.connective == Connective.IFF: return "↔R", i, "R"
            if isinstance(f, Negation): return "¬R", i, "R"
            if isinstance(f, QuantifiedFormula):
                if f.quantifier == Quantifier.FORALL: return "∀R", i, "R"
                if f.quantifier == Quantifier.EXISTS: return "∃R", i, "R"
        
        return None

    def _apply_rule(self, sequent: Sequent, rule: str, idx: int, side: str, max_depth: int, term_depth: int) -> Optional[DerivationTree]:
        new_antecedent = list(sequent.antecedent)
        new_succedent = list(sequent.succedent)
        
        if side == "L":
            f = new_antecedent.pop(idx)
        else:
            f = new_succedent.pop(idx)

        children_sequents = []

        if rule == "∧L":
            children_sequents = [Sequent(new_antecedent + [f.left, f.right], new_succedent)]
        elif rule == "¬L":
            children_sequents = [Sequent(new_antecedent, new_succedent + [f.formula])]
        elif rule == "∃L":
            # Fresh eigenvariable
            avoid = self._get_all_vars(sequent)
            fresh_var = Variable(self._variant("z", avoid))
            children_sequents = [Sequent(new_antecedent + [f.instantiate(fresh_var)], new_succedent)]
        elif rule == "∨R":
            children_sequents = [Sequent(new_antecedent, new_succedent + [f.left, f.right])]
        elif rule == "→R":
            children_sequents = [Sequent(new_antecedent + [f.left], new_succedent + [f.right])]
        elif rule == "¬R":
            children_sequents = [Sequent(new_antecedent + [f.formula], new_succedent)]
        elif rule == "∀R":
            # Fresh eigenvariable
            avoid = self._get_all_vars(sequent)
            fresh_var = Variable(self._variant("z", avoid))
            children_sequents = [Sequent(new_antecedent, new_succedent + [f.instantiate(fresh_var)])]
        elif rule == "∨L":
            children_sequents = [
                Sequent(new_antecedent + [f.left], new_succedent),
                Sequent(new_antecedent + [f.right], new_succedent)
            ]
        elif rule == "→L":
            children_sequents = [
                Sequent(new_antecedent, new_succedent + [f.left]),
                Sequent(new_antecedent + [f.right], new_succedent)
            ]
        elif rule == "∧R":
            children_sequents = [
                Sequent(new_antecedent, new_succedent + [f.left]),
                Sequent(new_antecedent, new_succedent + [f.right])
            ]
        elif rule == "↔L":
            imp1 = BinaryOp(Connective.IMPLIES, f.left, f.right)
            imp2 = BinaryOp(Connective.IMPLIES, f.right, f.left)
            children_sequents = [Sequent(new_antecedent + [imp1, imp2], new_succedent)]
        elif rule == "↔R":
            imp1 = BinaryOp(Connective.IMPLIES, f.left, f.right)
            imp2 = BinaryOp(Connective.IMPLIES, f.right, f.left)
            children_sequents = [
                Sequent(new_antecedent, new_succedent + [imp1]),
                Sequent(new_antecedent, new_succedent + [imp2])
            ]
        
        children_trees = []
        for s in children_sequents:
            child = self._search(s, max_depth - 1, term_depth)
            if child is None:
                return None
            children_trees.append(child)
        
        return DerivationTree(sequent, rule_applied=rule, children=children_trees)

    def _apply_quantifier_rule(self, sequent: Sequent, rule: str, idx: int, side: str, max_depth: int, term_depth: int) -> Optional[DerivationTree]:
        f = sequent.antecedent[idx] if side == "L" else sequent.succedent[idx]
        
        # Herbrand universe enumeration
        terms = self._enumerate_terms(sequent, term_depth)
        
        for t in terms:
            if side == "L": # ∀L
                new_ant = list(sequent.antecedent)
                # Keep the quantifier for completeness (contraction) but move to end
                quant = new_ant.pop(idx)
                new_ant.append(quant)
                # Add instantiated formula to front
                new_ant.insert(0, f.instantiate(t))
                new_seq = Sequent(new_ant, list(sequent.succedent))
            else: # ∃R
                new_suc = list(sequent.succedent)
                quant = new_suc.pop(idx)
                new_suc.append(quant)
                new_suc.insert(0, f.instantiate(t))
                new_seq = Sequent(list(sequent.antecedent), new_suc)
            
            child = self._search(new_seq, max_depth - 1, term_depth)
            if child:
                return DerivationTree(sequent, rule_applied=f"{rule}({t})", children=[child])
        
        return None

    def _enumerate_terms(self, sequent: Sequent, max_depth: int) -> List[Term]:
        # Collect all function symbols and constants in the sequent
        # If none, use default constant 'c'
        funcs = self._get_functions(sequent)
        if not any(arity == 0 for name, arity in funcs.items()):
            funcs['c'] = 0
        
        return self._gen_terms(funcs, max_depth)

    def _gen_terms(self, funcs: dict, max_depth: int) -> List[Term]:
        if max_depth < 0: return []
        
        constants = [Constant(name) for name, arity in funcs.items() if arity == 0]
        if max_depth == 0:
            return constants
        
        smaller_terms = self._gen_terms(funcs, max_depth - 1)
        new_terms = []
        
        for name, arity in funcs.items():
            if arity == 0:
                continue
            
            for args in itertools.product(smaller_terms, repeat=arity):
                new_terms.append(Function(name, args))
        
        # Unique terms
        seen = set()
        result = []
        for t in constants + new_terms:
            ts = str(t)
            if ts not in seen:
                seen.add(ts)
                result.append(t)
        return result

    def _get_functions(self, sequent: Sequent) -> dict:
        funcs = {}
        def collect(f_or_t, bound=set()):
            if isinstance(f_or_t, Function):
                funcs[f_or_t.name] = len(f_or_t.args)
                for a in f_or_t.args: collect(a, bound)
            elif isinstance(f_or_t, Constant):
                funcs[f_or_t.name] = 0
            elif isinstance(f_or_t, Variable):
                if f_or_t.name not in bound:
                    funcs[f_or_t.name] = 0
            elif isinstance(f_or_t, Atom):
                for a in f_or_t.args: collect(a, bound)
            elif isinstance(f_or_t, Negation):
                collect(f_or_t.formula, bound)
            elif isinstance(f_or_t, BinaryOp):
                collect(f_or_t.left, bound); collect(f_or_t.right, bound)
            elif isinstance(f_or_t, QuantifiedFormula):
                collect(f_or_t.body, bound | {f_or_t.variable.name})
        
        for f in sequent.antecedent + sequent.succedent:
            collect(f)
        return funcs

    def _get_all_vars(self, sequent: Sequent) -> Set[str]:
        vars = set()
        def collect(f_or_t):
            if isinstance(f_or_t, Variable):
                vars.add(f_or_t.name)
            elif isinstance(f_or_t, Function):
                for a in f_or_t.args: collect(a)
            elif isinstance(f_or_t, Atom):
                for a in f_or_t.args: collect(a)
            elif isinstance(f_or_t, Negation):
                collect(f_or_t.formula)
            elif isinstance(f_or_t, BinaryOp):
                collect(f_or_t.left); collect(f_or_t.right)
            elif isinstance(f_or_t, QuantifiedFormula):
                vars.add(f_or_t.variable.name)
                collect(f_or_t.body)
        
        for f in sequent.antecedent + sequent.succedent:
            collect(f)
        return vars

    def _variant(self, name: str, avoid: Set[str]) -> str:
        v = name
        while v in avoid:
            v += "'"
        return v

if __name__ == "__main__":
    from parser import parse_formula
    
    prover = BaselineProver()
    
    # Simple syllogism: (forall x. M(x) -> P(x)) & M(s) -> P(s)
    f_str = "(A.x (M(x) -> P(x)) & M(s)) -> P(s)"
    f = parse_formula(f_str)
    
    print(f"Proving: {f_str}")
    success, tree, stats = prover.prove(f)
    
    if success:
        print("PROVED!")
        print(f"Steps: {stats['steps']}")
        print(f"Time: {stats['time_ms']:.2f} ms")
        print("\nProof Tree:")
        print(tree)
    else:
        print("NOT PROVED within limits.")
