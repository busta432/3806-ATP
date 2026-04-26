"""
Baseline LK' Backward Search (Algorithm 2).
Strict adherence to the naive textbook algorithm using prioritized tiers.
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
        for term_d in range(4):
            for max_d in range(1, 21):
                if self._check_timeout(): break
                
                res = self._search(initial_sequent, max_d, term_d, set())
                if res:
                    elapsed = (time.time() - self.start_time) * 1000.0
                    return True, res, {
                        "steps": self.steps, "max_depth": self.max_depth_reached,
                        "time_ms": elapsed, "term_depth": term_d
                    }
            if self._check_timeout(): break

        return False, None, {
            "steps": self.steps, "max_depth": self.max_depth_reached,
            "time_ms": (time.time() - self.start_time) * 1000.0
        }

    def _search(self, sequent: Sequent, max_depth: int, term_depth: int, used: Set[Tuple[Formula, Term]]) -> Optional[DerivationTree]:
        self.steps += 1
        self.max_depth_reached = max(self.max_depth_reached, 20 - max_depth)

        if self._check_timeout(): return None

        # 1. Tier 1: Axiom check (Axioms must be checked before any expansion)
        if any(isinstance(f, Atom) and f.predicate == "⊤" for f in sequent.succedent):
            return DerivationTree(sequent, rule_applied="⊤R")
        if any(isinstance(f, Atom) and f.predicate == "⊥" for f in sequent.antecedent):
            return DerivationTree(sequent, rule_applied="⊥L")
        for a in sequent.antecedent:
            for s in sequent.succedent:
                if a == s: return DerivationTree(sequent, rule_applied="id")

        if max_depth <= 0: return None

        # 2. Tier 2: Non-branching propositional and eigenvariable rules
        # (∧L, ∨R, →R, ¬L, ¬R, ↔L, ∀R, ∃L)
        rule = self._find_tier2_rule(sequent)
        if rule:
            rule_name, idx, side = rule
            return self._apply_rule(sequent, rule_name, idx, side, max_depth, term_depth, used)

        # 3. Tier 3: Branching propositional rules (∧R, ∨L, →L, ↔R)
        rule = self._find_tier3_rule(sequent)
        if rule:
            rule_name, idx, side = rule
            return self._apply_rule(sequent, rule_name, idx, side, max_depth, term_depth, used)

        # 4. Tier 4/5: Quantifier instantiation (∀L, ∃R)
        rule = self._find_tier4_rule(sequent)
        if rule:
            rule_name, idx, side = rule
            return self._apply_quantifier_rule(sequent, rule_name, idx, side, max_depth, term_depth, used)

        return None

    def _find_tier2_rule(self, sequent: Sequent):
        # Antecedent
        for i, f in enumerate(sequent.antecedent):
            if isinstance(f, BinaryOp):
                if f.connective == Connective.AND: return "∧L", i, "L"
                if f.connective == Connective.IFF: return "↔L", i, "L"
            elif isinstance(f, Negation): return "¬L", i, "L"
            elif isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.EXISTS: return "∃L", i, "L"
        # Succedent
        for i, f in enumerate(sequent.succedent):
            if isinstance(f, BinaryOp):
                if f.connective == Connective.OR:  return "∨R", i, "R"
                if f.connective == Connective.IMPLIES: return "→R", i, "R"
            elif isinstance(f, Negation): return "¬R", i, "R"
            elif isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.FORALL: return "∀R", i, "R"
        return None

    def _find_tier3_rule(self, sequent: Sequent):
        # Antecedent
        for i, f in enumerate(sequent.antecedent):
            if isinstance(f, BinaryOp):
                if f.connective == Connective.OR: return "∨L", i, "L"
                if f.connective == Connective.IMPLIES: return "→L", i, "L"
        # Succedent
        for i, f in enumerate(sequent.succedent):
            if isinstance(f, BinaryOp):
                if f.connective == Connective.AND: return "∧R", i, "R"
                if f.connective == Connective.IFF: return "↔R", i, "R"
        return None

    def _find_tier4_rule(self, sequent: Sequent):
        # Antecedent
        for i, f in enumerate(sequent.antecedent):
            if isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.FORALL: return "∀L", i, "L"
        # Succedent
        for i, f in enumerate(sequent.succedent):
            if isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.EXISTS: return "∃R", i, "R"
        return None

    def _apply_rule(self, sequent: Sequent, rule: str, idx: int, side: str, max_depth: int, term_depth: int, used: Set[Tuple[Formula, Term]]) -> Optional[DerivationTree]:
        new_ant, new_suc = list(sequent.antecedent), list(sequent.succedent)
        f = new_ant.pop(idx) if side == "L" else new_suc.pop(idx)
        children_sequents = []

        if rule == "∧L": children_sequents = [Sequent(new_ant + [f.left, f.right], new_suc)]
        elif rule == "¬L": children_sequents = [Sequent(new_ant, new_suc + [f.formula])]
        elif rule == "∃L":
            x_prime = self._variant("z", self._get_all_vars(sequent))
            children_sequents = [Sequent(new_ant + [f.instantiate(Variable(x_prime))], new_suc)]
        elif rule == "∨R": children_sequents = [Sequent(new_ant, new_suc + [f.left, f.right])]
        elif rule == "→R": children_sequents = [Sequent(new_ant + [f.left], new_suc + [f.right])]
        elif rule == "¬R": children_sequents = [Sequent(new_ant + [f.formula], new_suc)]
        elif rule == "∀R":
            x_prime = self._variant("z", self._get_all_vars(sequent))
            children_sequents = [Sequent(new_ant, new_suc + [f.instantiate(Variable(x_prime))])]
        elif rule == "∨L": children_sequents = [Sequent(new_ant + [f.left], new_suc), Sequent(new_ant + [f.right], new_suc)]
        elif rule == "→L": children_sequents = [Sequent(new_ant, new_suc + [f.left]), Sequent(new_ant + [f.right], new_suc)]
        elif rule == "∧R": children_sequents = [Sequent(new_ant, new_suc + [f.left]), Sequent(new_ant, new_suc + [f.right])]
        elif rule == "↔L":
            imp1 = BinaryOp(Connective.IMPLIES, f.left, f.right)
            imp2 = BinaryOp(Connective.IMPLIES, f.right, f.left)
            children_sequents = [Sequent(new_ant + [imp1, imp2], new_suc)]
        elif rule == "↔R":
            imp1 = BinaryOp(Connective.IMPLIES, f.left, f.right)
            imp2 = BinaryOp(Connective.IMPLIES, f.right, f.left)
            children_sequents = [Sequent(new_ant, new_suc + [imp1]), Sequent(new_ant, new_suc + [imp2])]

        children_trees = []
        for s in children_sequents:
            child = self._search(s, max_depth - 1, term_depth, used)
            if child is None: return None
            children_trees.append(child)
        return DerivationTree(sequent, rule_applied=rule, children=children_trees)

    def _apply_quantifier_rule(self, sequent: Sequent, rule: str, idx: int, side: str, max_depth: int, term_depth: int, used: Set[Tuple[Formula, Term]]) -> Optional[DerivationTree]:
        f = sequent.antecedent[idx] if side == "L" else sequent.succedent[idx]
        terms = self._enumerate_terms(sequent, term_depth)
        
        # Tier 4: Try unused existing terms
        for t in terms:
            if (f, t) in used: continue
            
            new_used = used | {(f, t)}
            if side == "L":
                new_ant = list(sequent.antecedent)
                quant = new_ant.pop(idx); new_ant.append(quant) # Contraction
                new_ant.insert(0, f.instantiate(t))
                new_seq = Sequent(new_ant, list(sequent.succedent))
            else:
                new_suc = list(sequent.succedent)
                quant = new_suc.pop(idx); new_suc.append(quant)
                new_suc.insert(0, f.instantiate(t))
                new_seq = Sequent(list(sequent.antecedent), new_suc)
            
            child = self._search(new_seq, max_depth - 1, term_depth, new_used)
            if child: return DerivationTree(sequent, rule_applied=f"{rule}({t})", children=[child])
        
        # Tier 5: Fallback to fresh variable
        x_prime = self._variant("z", self._get_all_vars(sequent))
        t = Variable(x_prime)
        new_used = used | {(f, t)}
        if side == "L":
            new_ant = list(sequent.antecedent)
            quant = new_ant.pop(idx); new_ant.append(quant)
            new_ant.insert(0, f.instantiate(t))
            new_seq = Sequent(new_ant, list(sequent.succedent))
        else:
            new_suc = list(sequent.succedent)
            quant = new_suc.pop(idx); new_suc.append(quant)
            new_suc.insert(0, f.instantiate(t))
            new_seq = Sequent(list(sequent.antecedent), new_suc)
            
        child = self._search(new_seq, max_depth - 1, term_depth, new_used)
        if child: return DerivationTree(sequent, rule_applied=f"{rule}({t})", children=[child])
        
        return None

    def _enumerate_terms(self, sequent: Sequent, max_depth: int) -> List[Term]:
        funcs = self._get_functions(sequent)
        if not any(arity == 0 for name, arity in funcs.items()): funcs['c'] = 0
        return self._gen_terms(funcs, max_depth)

    def _gen_terms(self, funcs: dict, max_depth: int) -> List[Term]:
        if max_depth < 0: return []
        constants = [Constant(name) for name, arity in funcs.items() if arity == 0]
        if max_depth == 0: return constants
        smaller_terms = self._gen_terms(funcs, max_depth - 1)
        new_terms = []
        for name, arity in funcs.items():
            if arity == 0: continue
            for args in itertools.product(smaller_terms, repeat=arity):
                new_terms.append(Function(name, args))
        seen = set()
        result = []
        for t in constants + new_terms:
            ts = str(t)
            if ts not in seen:
                seen.add(ts); result.append(t)
        return result

    def _get_functions(self, sequent: Sequent) -> dict:
        funcs = {}
        def collect(f_or_t, bound=set()):
            if isinstance(f_or_t, Function):
                funcs[f_or_t.name] = len(f_or_t.args)
                for a in f_or_t.args: collect(a, bound)
            elif isinstance(f_or_t, Constant): funcs[f_or_t.name] = 0
            elif isinstance(f_or_t, Variable):
                if f_or_t.name not in bound: funcs[f_or_t.name] = 0
            elif isinstance(f_or_t, Atom):
                for a in f_or_t.args: collect(a, bound)
            elif isinstance(f_or_t, Negation): collect(f_or_t.formula, bound)
            elif isinstance(f_or_t, BinaryOp):
                collect(f_or_t.left, bound); collect(f_or_t.right, bound)
            elif isinstance(f_or_t, QuantifiedFormula):
                collect(f_or_t.body, bound | {f_or_t.variable.name})
        for f in sequent.antecedent + sequent.succedent: collect(f)
        return funcs

    def _get_all_vars(self, sequent: Sequent) -> Set[str]:
        vars = set()
        def collect(f_or_t):
            if isinstance(f_or_t, Variable): vars.add(f_or_t.name)
            elif isinstance(f_or_t, Function):
                for a in f_or_t.args: collect(a)
            elif isinstance(f_or_t, Atom):
                for a in f_or_t.args: collect(a)
            elif isinstance(f_or_t, Negation): collect(f_or_t.formula)
            elif isinstance(f_or_t, BinaryOp):
                collect(f_or_t.left); collect(f_or_t.right)
            elif isinstance(f_or_t, QuantifiedFormula):
                vars.add(f_or_t.variable.name); collect(f_or_t.body)
        for f in sequent.antecedent + sequent.succedent: collect(f)
        return vars

    def _variant(self, name: str, avoid: Set[str]) -> str:
        v = name
        while v in avoid: v += "'"
        return v

if __name__ == "__main__":
    from parser import parse_formula
    prover = BaselineProver()
    # Problem that requires exhausting propositional rules before instantiation
    f_str = "(A.x P(x)) -> P(a) & P(b)"
    f = parse_formula(f_str)
    print(f"Proving: {f_str}")
    success, tree, stats = prover.prove(f)
    if success:
        print("PROVED!")
        print(f"Steps: {stats['steps']}"); print(f"Time: {stats['time_ms']:.2f} ms")
        print("\nProof Tree:"); print(tree)
    else: print("NOT PROVED within limits.")
