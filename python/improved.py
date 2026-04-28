"""
improved.py — ENGINE 2: Improved LK' Prover.
Ported from improved.ml.
"""

import time
from typing import Optional, Set, List, Tuple
from fol_types import (
    Term, Variable, Constant, Function,
    Formula, Atom, Negation, BinaryOp, Connective,
    QuantifiedFormula, Quantifier,
    Sequent, DerivationTree
)
from formula_utils import free_vars, variant, formula_equal, formula_complexity
from unification import unify, apply, apply_to_formula
from indexing import FingerprintIndex

class ImprovedProver:
    def __init__(self, timeout_ms: float = 50000.0):
        self.timeout_ms = timeout_ms
        self.start_time = 0.0
        self.steps = 0
        self.max_depth_reached = 0

    def _check_timeout(self) -> bool:
        elapsed = (time.time() - self.start_time) * 1000.0
        return elapsed > self.timeout_ms

    def _is_metavar(self, name: str) -> bool:
        return name.startswith("?")

    def _fresh_metavar(self, n: int) -> Tuple[str, int]:
        return f"?{n}", n + 1

    def _formula_list_equal(self, l1: List[Formula], l2: List[Formula]) -> bool:
        if len(l1) != len(l2): return False
        for f1 in l1:
            if not any(f1 == f2 for f2 in l2): return False
        return True

    def _sequent_equal(self, s1: Sequent, s2: Sequent) -> bool:
        return self._formula_list_equal(s1.antecedent, s2.antecedent) and \
               self._formula_list_equal(s1.succedent, s2.succedent)

    def _find_identity(self, sigma: dict, antecedent: List[Formula], succedent: List[Formula]) -> Optional[dict]:
        index = FingerprintIndex()
        non_atom_ants = set()
        for a in antecedent:
            if isinstance(a, Atom):
                index.insert(a)
            else:
                non_atom_ants.add(a)
        
        for s in succedent:
            if not isinstance(s, Atom):
                if s in non_atom_ants: return sigma
            else:
                candidates = index.query(s)
                for a_atom in candidates:
                    term_pairs = list(zip(a_atom.args, s.args))
                    res = unify(sigma, term_pairs, is_substitutable=self._is_metavar)
                    if res is not None:
                        return res
        return None

    def prove(self, formula: Formula) -> Tuple[bool, dict]:
        self.start_time = time.time()
        self.steps = 0
        self.max_depth_reached = 0
        initial_sequent = Sequent(antecedent=[], succedent=[formula])
        failed_cache = set()
        
        for limit in range(1, 31):
            if self._check_timeout(): break
            res = self._search(limit, {}, 0, [], set(), failed_cache, initial_sequent)
            if res:
                elapsed = (time.time() - self.start_time) * 1000.0
                return True, {"steps": self.steps, "max_depth": self.max_depth_reached, "time_ms": elapsed}
        
        return False, {"steps": self.steps, "max_depth": self.max_depth_reached, "time_ms": (time.time() - self.start_time) * 1000.0}

    def _canonical_state(self, sigma: dict, sequent: Sequent) -> int:
        ant_norm = sorted([str(apply_to_formula(sigma, f)) for f in sequent.antecedent])
        suc_norm = sorted([str(apply_to_formula(sigma, f)) for f in sequent.succedent])
        return hash((tuple(ant_norm), tuple(suc_norm)))

    def _search(self, depth_limit: int, sigma: dict, metavars: int, history: List[Sequent], seen_literals: Set[str], failed_cache: Set[Tuple[int, int]], sequent: Sequent) -> Optional[Tuple[dict, int]]:
        self.steps += 1
        # print(f"DEBUG: Search depth={depth_limit} sigma={sigma} seq={sequent}")
        self.max_depth_reached = max(self.max_depth_reached, 30 - depth_limit)

        if self._check_timeout(): return None
        if depth_limit < 0: return None
        
        state_hash = self._canonical_state(sigma, sequent)
        if (state_hash, depth_limit) in failed_cache: return None

        # Regularity Condition: Prevent repetition of identical literals along a branch
        current_literals = set()
        for f in sequent.antecedent:
            if f.is_literal():
                current_literals.add(f"L:{apply_to_formula(sigma, f)}")
        for f in sequent.succedent:
            if f.is_literal():
                current_literals.add(f"R:{apply_to_formula(sigma, f)}")
        
        # We only check for newly added literals to avoid pruning surviving literals
        parent_literals = set()
        if history:
            parent = history[-1]
            for f in parent.antecedent:
                if f.is_literal(): parent_literals.add(f"L:{apply_to_formula(sigma, f)}")
            for f in parent.succedent:
                if f.is_literal(): parent_literals.add(f"R:{apply_to_formula(sigma, f)}")
        
        newly_added = current_literals - parent_literals
        if newly_added & seen_literals:
            return None
        
        new_seen = seen_literals | current_literals

        if any(self._sequent_equal(s, sequent) for s in history): return None

        # 1. Axiom Checks
        if any(isinstance(f, Atom) and f.predicate == "⊤" for f in sequent.succedent) or \
           any(isinstance(f, Atom) and f.predicate == "⊥" for f in sequent.antecedent):
            return sigma, metavars
        
        id_sigma = self._find_identity(sigma, sequent.antecedent, sequent.succedent)
        if id_sigma is not None:
            return id_sigma, metavars
        
        if depth_limit == 0: return None

        # 2. Rule Selection with Complexity Ordering
        inv, br, inst = self._find_all_rules(sequent)
        
        def try_rules(rules_list):
            for rule in rules_list:
                res = self._apply_and_search(depth_limit - 1, sigma, metavars, history + [sequent], new_seen, failed_cache, sequent, rule)
                if res: return res
            return None

        res = None
        if inv:
            res = try_rules(inv)
        else:
            res = try_rules(br + inst)
        
        if res is None:
            failed_cache.add(state_hash)
        return res

    def _find_all_rules(self, sequent: Sequent):
        inv_l, br_l, inst_l = self._collect_left_rules(0, sequent.antecedent)
        inv_r, br_r, inst_r = self._collect_right_rules(0, sequent.succedent)
        
        def get_formula(rule_info):
            rule, i = rule_info
            if rule.endswith("_L"): return sequent.antecedent[i]
            return sequent.succedent[i]

        # Prioritise expansion of the "least complex" formula first
        inv = sorted(inv_l + inv_r, key=lambda r: formula_complexity(get_formula(r)))
        br = sorted(br_l + br_r, key=lambda r: formula_complexity(get_formula(r)))
        inst = sorted(inst_l + inst_r, key=lambda r: formula_complexity(get_formula(r)))
        
        return inv, br, inst

    def _collect_left_rules(self, i: int, formulas: List[Formula]):
        if not formulas: return [], [], []
        inv, br, inst = self._collect_left_rules(i + 1, formulas[1:])
        f = formulas[0]
        if isinstance(f, BinaryOp):
            if f.connective == Connective.AND: return [("AND_L", i)] + inv, br, inst
            if f.connective == Connective.OR: return inv, [("OR_L", i)] + br, inst
            if f.connective == Connective.IMPLIES: return inv, [("IMP_L", i)] + br, inst
            if f.connective == Connective.IFF: return [("IFF_L", i)] + inv, br, inst
        if isinstance(f, Negation): return [("NOT_L", i)] + inv, br, inst
        if isinstance(f, QuantifiedFormula):
            if f.quantifier == Quantifier.EXISTS: return [("EXISTS_L", i)] + inv, br, inst
            if f.quantifier == Quantifier.FORALL: return inv, br, [("FORALL_L", i)] + inst
        return inv, br, inst

    def _collect_right_rules(self, i: int, formulas: List[Formula]):
        if not formulas: return [], [], []
        inv, br, inst = self._collect_right_rules(i + 1, formulas[1:])
        f = formulas[0]
        if isinstance(f, BinaryOp):
            if f.connective == Connective.AND: return inv, [("AND_R", i)] + br, inst
            if f.connective == Connective.OR: return [("OR_R", i)] + inv, br, inst
            if f.connective == Connective.IMPLIES: return [("IMP_R", i)] + inv, br, inst
            if f.connective == Connective.IFF: return inv, [("IFF_R", i)] + br, inst
        if isinstance(f, Negation): return [("NOT_R", i)] + inv, br, inst
        if isinstance(f, QuantifiedFormula):
            if f.quantifier == Quantifier.FORALL: return [("FORALL_R", i)] + inv, br, inst
            if f.quantifier == Quantifier.EXISTS: return inv, br, [("EXISTS_R", i)] + inst
        return inv, br, inst

    def _apply_and_search(self, depth, sigma, metavars, history, seen_literals, failed_cache, sequent, rule_info) -> Optional[Tuple[dict, int]]:
        rule, i = rule_info
        new_ant, new_suc = list(sequent.antecedent), list(sequent.succedent)
        
        if rule == "AND_L":
            f = new_ant.pop(i)
            return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant + [f.left, f.right], new_suc))
        if rule == "OR_R":
            f = new_suc.pop(i)
            return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [f.left, f.right]))
        if rule == "IMP_R":
            f = new_suc.pop(i)
            return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant + [f.left], new_suc + [f.right]))
        if rule == "NOT_L":
            f = new_ant.pop(i)
            return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [f.formula]))
        if rule == "NOT_R":
            f = new_suc.pop(i)
            return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant + [f.formula], new_suc))
        if rule == "IFF_L":
            f = new_ant.pop(i)
            imp1 = BinaryOp(Connective.IMPLIES, f.left, f.right)
            imp2 = BinaryOp(Connective.IMPLIES, f.right, f.left)
            return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant + [imp1, imp2], new_suc))
        if rule == "IFF_R":
            f = new_suc.pop(i)
            imp1 = BinaryOp(Connective.IMPLIES, f.left, f.right)
            imp2 = BinaryOp(Connective.IMPLIES, f.right, f.left)
            res = self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [imp1]))
            if res: return self._search(depth, res[0], res[1], history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [imp2]))
            return None
        if rule == "EXISTS_L" or rule == "FORALL_R":
            f = (new_ant if rule == "EXISTS_L" else new_suc).pop(i)
            avoid = []
            for fm in sequent.antecedent + sequent.succedent:
                avoid.extend(free_vars(fm))
            x_prime = variant(f.variable.name, avoid)
            body_prime = f.instantiate(Variable(x_prime))
            if rule == "EXISTS_L": return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant + [body_prime], new_suc))
            else: return self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [body_prime]))
        if rule == "AND_R":
            f = new_suc.pop(i)
            res = self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [f.left]))
            if res: return self._search(depth, res[0], res[1], history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [f.right]))
            return None
        if rule == "OR_L":
            f = new_ant.pop(i)
            res = self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant + [f.left], new_suc))
            if res: return self._search(depth, res[0], res[1], history, seen_literals, failed_cache, Sequent(new_ant + [f.right], new_suc))
            return None
        if rule == "IMP_L":
            f = new_ant.pop(i)
            res = self._search(depth, sigma, metavars, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [f.left]))
            if res: return self._search(depth, res[0], res[1], history, seen_literals, failed_cache, Sequent(new_ant + [f.right], new_suc))
            return None
        if rule == "FORALL_L" or rule == "EXISTS_R":
            f = new_ant[i] if rule == "FORALL_L" else new_suc[i]
            mv, next_mv = self._fresh_metavar(metavars)
            body_prime = f.instantiate(Variable(mv))
            if rule == "FORALL_L":
                new_ant = new_ant[:i] + new_ant[i+1:] + [f]
                return self._search(depth, sigma, next_mv, history, seen_literals, failed_cache, Sequent(new_ant + [body_prime], new_suc))
            else:
                new_suc = new_suc[:i] + new_suc[i+1:] + [f]
                return self._search(depth, sigma, next_mv, history, seen_literals, failed_cache, Sequent(new_ant, new_suc + [body_prime]))
        return None
