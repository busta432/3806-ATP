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
    def __init__(self, timeout_ms: float = 50000.0):
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
        for term_d in range(4): #Limits structural complexity.
            for max_d in range(1, 21): #Constrains max height of the proof tree.
                if self._check_timeout(): break
                
                res = self._search(initial_sequent, max_d, term_d, set(), True)
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

    def _search(self, sequent: Sequent, max_depth: int, term_depth: int, used: Set[Tuple[Formula, Term]], toggle: bool) -> Optional[DerivationTree]:
        self.steps += 1
        self.max_depth_reached = max(self.max_depth_reached, 20 - max_depth)

        if self._check_timeout(): return None

        # 1. Tier 1: Axioms
        if any(isinstance(f, Atom) and f.predicate == "⊤" for f in sequent.succedent):
            return DerivationTree(sequent, rule_applied="⊤R")
        if any(isinstance(f, Atom) and f.predicate == "⊥" for f in sequent.antecedent):
            return DerivationTree(sequent, rule_applied="⊥L")
        for a in sequent.antecedent:
            for s in sequent.succedent:
                if a == s: return DerivationTree(sequent, rule_applied="id")

        if max_depth <= 0: return None

        # 2. Tier 2: Non-branching propositional and eigenvariable rules
        rules2 = self._find_all_tier2_rules(sequent, toggle)
        if rules2:
            for rule_name, idx, side in rules2:
                tree = self._apply_rule(sequent, rule_name, idx, side, max_depth, term_depth, used, not toggle)
                if tree: return tree
            return None # Else-if: If Tier 2 is applicable, we must use it. If all fail, branch fails.

        # 3. Tier 3: Branching propositional rules
        rules3 = self._find_all_tier3_rules(sequent, toggle)
        if rules3:
            for rule_name, idx, side in rules3:
                tree = self._apply_rule(sequent, rule_name, idx, side, max_depth, term_depth, used, not toggle)
                if tree: return tree
            return None

        # 4. Tier 4: Quantifier instantiation with UNUSED EXISTING terms
        apps4 = self._find_all_tier4_applications(sequent, term_depth, used, toggle)
        if apps4:
            for rule_name, idx, side, t in apps4:
                tree = self._apply_quantifier_instantiation(sequent, rule_name, idx, side, t, max_depth, term_depth, used, not toggle)
                if tree: return tree
            return None

        # 5. Tier 5: Quantifier instantiation with FRESH term
        rules5 = self._find_all_tier5_rules(sequent, toggle)
        if rules5:
            for rule_name, idx, side in rules5:
                # Generate a fresh variable
                x_prime = self._variant("z", self._get_all_vars(sequent))
                t = Variable(x_prime)
                tree = self._apply_quantifier_instantiation(sequent, rule_name, idx, side, t, max_depth, term_depth, used, not toggle)
                if tree: return tree
            return None

        return None

    def _find_all_tier2_rules(self, sequent: Sequent, toggle: bool):
        rules = []
        # Priority order depends on toggle
        sides = [("L", sequent.antecedent), ("R", sequent.succedent)] if toggle else [("R", sequent.succedent), ("L", sequent.antecedent)]
        for side, formulas in sides:
            for i, f in enumerate(formulas):
                if side == "L":
                    if isinstance(f, BinaryOp) and f.connective in (Connective.AND, Connective.IFF): rules.append((f"{'∧' if f.connective==Connective.AND else '↔'}L", i, "L"))
                    elif isinstance(f, Negation): rules.append(("¬L", i, "L"))
                    elif isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.EXISTS: rules.append(("∃L", i, "L"))
                else: # side == "R"
                    if isinstance(f, BinaryOp) and f.connective in (Connective.OR, Connective.IMPLIES): rules.append((f"{'∨' if f.connective==Connective.OR else '→'}R", i, "R"))
                    elif isinstance(f, Negation): rules.append(("¬R", i, "R"))
                    elif isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.FORALL: rules.append(("∀R", i, "R"))
        return rules

    def _find_all_tier3_rules(self, sequent: Sequent, toggle: bool):
        rules = []
        sides = [("L", sequent.antecedent), ("R", sequent.succedent)] if toggle else [("R", sequent.succedent), ("L", sequent.antecedent)]
        for side, formulas in sides:
            for i, f in enumerate(formulas):
                if side == "L":
                    if isinstance(f, BinaryOp) and f.connective in (Connective.OR, Connective.IMPLIES): rules.append((f"{'∨' if f.connective==Connective.OR else '→'}L", i, "L"))
                else: # side == "R"
                    if isinstance(f, BinaryOp) and f.connective in (Connective.AND, Connective.IFF): rules.append((f"{'∧' if f.connective==Connective.AND else '↔'}R", i, "R"))
        return rules

    def _find_all_tier4_applications(self, sequent: Sequent, term_depth: int, used: Set[Tuple[Formula, Term]], toggle: bool):
        apps = []
        terms = self._enumerate_terms(sequent, term_depth)
        sides = [("L", sequent.antecedent), ("R", sequent.succedent)] if toggle else [("R", sequent.succedent), ("L", sequent.antecedent)]
        for side, formulas in sides:
            for i, f in enumerate(formulas):
                if side == "L" and isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.FORALL:
                    for t in terms:
                        if (f, t) not in used: apps.append(("∀L", i, "L", t))
                elif side == "R" and isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.EXISTS:
                    for t in terms:
                        if (f, t) not in used: apps.append(("∃R", i, "R", t))
        return apps

    def _find_all_tier5_rules(self, sequent: Sequent, toggle: bool):
        rules = []
        sides = [("L", sequent.antecedent), ("R", sequent.succedent)] if toggle else [("R", sequent.succedent), ("L", sequent.antecedent)]
        for side, formulas in sides:
            for i, f in enumerate(formulas):
                if side == "L" and isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.FORALL: rules.append(("∀L", i, "L"))
                elif side == "R" and isinstance(f, QuantifiedFormula) and f.quantifier == Quantifier.EXISTS: rules.append(("∃R", i, "R"))
        return rules

# Describes How Each Rule Transforms the Sequent - Infernece Rules.
    def _apply_rule(self, sequent: Sequent, rule: str, idx: int, side: str, max_depth: int, term_depth: int, used: Set[Tuple[Formula, Term]], next_toggle: bool) -> Optional[DerivationTree]:
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
            child = self._search(s, max_depth - 1, term_depth, used, next_toggle)
            if child is None: return None
            children_trees.append(child)
        return DerivationTree(sequent, rule_applied=rule, children=children_trees)


    def _apply_quantifier_instantiation(self, sequent: Sequent, rule: str, idx: int, side: str, t: Term, max_depth: int, term_depth: int, used: Set[Tuple[Formula, Term]], next_toggle: bool) -> Optional[DerivationTree]:
        """
        The code implements this by retaining the quantified formula after instantiation (pop + append to end) while adding the instantiated version at the front.

        The used set prevents infinite loops: new_used = used | {(f, t)} creates a new set (immutable update) adding this pair. When the recursive call checks Tier 4, it skips any (formula, term) already in used. This set is local to each branch — sibling branches start fresh.

        Moving the quantifier to the end is a search heuristic — it deprioritizes re-using it immediately, giving other formulae a chance to simplify the sequent first. The rule still records the instantiated formula at position 0 so it's tried early next round.
        """
        f = sequent.antecedent[idx] if side == "L" else sequent.succedent[idx]
        new_used = used | {(f, t)}
        
        if side == "L": # ∀L
            new_ant = list(sequent.antecedent)
            quant = new_ant.pop(idx); new_ant.append(quant) # Contraction
            new_ant.insert(0, f.instantiate(t))
            new_seq = Sequent(new_ant, list(sequent.succedent))
        else: # ∃R
            new_suc = list(sequent.succedent)
            quant = new_suc.pop(idx); new_suc.append(quant)
            new_suc.insert(0, f.instantiate(t))
            new_seq = Sequent(list(sequent.antecedent), new_suc)
        
        child = self._search(new_seq, max_depth - 1, term_depth, new_used, next_toggle)
        if child: return DerivationTree(sequent, rule_applied=f"{rule}({t})", children=[child])
        return None

    def _enumerate_terms(self, sequent: Sequent, max_depth: int) -> List[Term]:
        funcs, base_terms = self._get_functions_and_base_terms(sequent)
        if not base_terms:
            base_terms.add(Constant('c'))
        return self._gen_terms(funcs, base_terms, max_depth)
    def _gen_terms(self, funcs: dict, base_terms: Set[Term], max_depth: int) -> List[Term]:
        if max_depth < 0: return []
        if max_depth == 0: return list(base_terms)
        
        smaller_terms = self._gen_terms(funcs, base_terms, max_depth - 1)
        new_terms = []
        for name, arity in funcs.items():
            for args in itertools.product(smaller_terms, repeat=arity):
                new_terms.append(Function(name, args))
        
        seen = set()
        result = []
        for t in list(base_terms) + new_terms:
            ts = str(t)
            if ts not in seen:
                seen.add(ts); result.append(t)
        return result
    def _get_functions_and_base_terms(self, sequent: Sequent) -> Tuple[dict, Set[Term]]:
        funcs = {}
        base_terms = set()
        def collect(f_or_t, bound=set()):
            if isinstance(f_or_t, Function):
                if f_or_t.args:
                    funcs[f_or_t.name] = len(f_or_t.args)
                    for a in f_or_t.args: collect(a, bound)
                else:
                    base_terms.add(f_or_t) # 0-ary function is a base term
            elif isinstance(f_or_t, Constant):
                base_terms.add(f_or_t)
            elif isinstance(f_or_t, Variable):
                if f_or_t.name not in bound: #Free Variables
                    base_terms.add(f_or_t)
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
        return funcs, base_terms


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
    f_str = "(A.x E.y (P_1(x) & P_2(y))) -> (A.x P_1(x) & E.x P_2(x))"
    f = parse_formula(f_str)
    print(f"Proving: {f_str}")
    success, tree, stats = prover.prove(f)
    if success:
        print("PROVED!")
        print(f"Steps: {stats['steps']}"); print(f"Time: {stats['time_ms']:.2f} ms")
        print("\nProof Tree:"); print(tree)
    else: print("NOT PROVED within limits.")
