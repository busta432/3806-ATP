"""
resolution.py — ENGINE 3: Resolution Refutation Prover.
Ported from resolution.ml.
"""

import time
from typing import List, Tuple, Optional, Set
from fol_types import Term, Variable, Function, Constant, Atom, Negation, Formula
from unification import apply, unify
from formula_utils import unique, free_vars
import cnf

# ================================================================
# TYPES
# ================================================================

class Literal:
    def __init__(self, formula: Formula):
        self.formula = formula
        if isinstance(formula, Atom):
            self.positive = True
            self.predicate = formula.predicate
            self.args = formula.args
        elif isinstance(formula, Negation) and isinstance(formula.formula, Atom):
            self.positive = False
            self.predicate = formula.formula.predicate
            self.args = formula.formula.args
        else:
            raise ValueError(f"Invalid literal formula: {formula}")

    def negate(self) -> 'Literal':
        if self.positive:
            return Literal(Negation(self.formula))
        else:
            return Literal(self.formula.formula)

    def apply_sigma(self, sigma: dict) -> 'Literal':
        def subst_term(t: Term) -> Term:
            if isinstance(t, Variable):
                if t.name in sigma: return subst_term(sigma[t.name])
                return t
            if isinstance(t, Function):
                return Function(t.name, tuple(subst_term(arg) for arg in t.args))
            return t
        
        new_args = tuple(subst_term(arg) for arg in self.args)
        if self.positive:
            return Literal(Atom(self.predicate, new_args))
        else:
            return Literal(Negation(Atom(self.predicate, new_args)))

    def __eq__(self, other):
        if not isinstance(other, Literal): return False
        return self.positive == other.positive and self.predicate == other.predicate and self.args == other.args

    def __hash__(self):
        return hash((self.positive, self.predicate, self.args))

    def __repr__(self):
        return f"{'' if self.positive else '~'}{self.predicate}({', '.join(map(str, self.args))})"

Clause = List[Literal]

# ================================================================
# UTILITIES
# ================================================================

def rename_clause(suffix: str, clause: Clause) -> Clause:
    def rename_term(t: Term) -> Term:
        if isinstance(t, Variable): return Variable(t.name + suffix)
        if isinstance(t, Function): return Function(t.name, tuple(rename_term(arg) for arg in t.args))
        return t
    
    new_clause = []
    for lit in clause:
        new_args = tuple(rename_term(arg) for arg in lit.args)
        if lit.positive:
            new_clause.append(Literal(Atom(lit.predicate, new_args)))
        else:
            new_clause.append(Literal(Negation(Atom(lit.predicate, new_args))))
    return new_clause

def is_tautology(clause: Clause) -> bool:
    positives = { (l.predicate, l.args) for l in clause if l.positive }
    negatives = { (l.predicate, l.args) for l in clause if not l.positive }
    return bool(positives & negatives)

def simplify_clause(clause: Clause) -> Clause:
    return unique(clause)

# ================================================================
# SUBSUMPTION
# ================================================================

def subsumes(c1: Clause, c2: Clause) -> bool:
    def search(sigma: dict, remaining_c1: Clause) -> bool:
        if not remaining_c1: return True
        l1 = remaining_c1[0]
        rest = remaining_c1[1:]
        
        for l2 in c2:
            if l1.positive == l2.positive and l1.predicate == l2.predicate:
                sigma_prime = unify(sigma, list(zip(l1.args, l2.args)))
                if sigma_prime is not None:
                    if search(sigma_prime, rest): return True
        return False

    if len(c1) > len(c2): return False
    return search({}, c1)

# ================================================================
# RESOLUTION & FACTORING
# ================================================================

def resolve(c1: Clause, c2: Clause) -> List[Clause]:
    c1_prime = rename_clause("_L", c1)
    c2_prime = rename_clause("_R", c2)
    resolvents = []
    
    for l1 in c1_prime:
        for l2 in c2_prime:
            if l1.positive != l2.positive and l1.predicate == l2.predicate:
                sigma = unify({}, list(zip(l1.args, l2.args)))
                if sigma is not None:
                    r = [l for l in c1_prime if l != l1] + [l for l in c2_prime if l != l2]
                    r_applied = [l.apply_sigma(sigma) for l in r]
                    resolvents.append(simplify_clause(r_applied))
    return resolvents

def factor(clause: Clause) -> List[Clause]:
    factors = []
    for i, l1 in enumerate(clause):
        for l2 in clause[i+1:]:
            if l1.positive == l2.positive and l1.predicate == l2.predicate:
                sigma = unify({}, list(zip(l1.args, l2.args)))
                if sigma is not None:
                    f_applied = [l.apply_sigma(sigma) for l in clause]
                    factors.append(simplify_clause(f_applied))
    return factors

# ================================================================
# OTTER LOOP
# ================================================================

class ResolutionProver:
    def __init__(self, timeout_ms: float = 50000.0):
        self.timeout_ms = timeout_ms

    def prove(self, formula: Formula) -> Tuple[bool, dict]:
        start_time = time.time()
        steps = 0
        clauses_gen = 0
        subsumptions = 0
        
        # Preprocessing: Negate -> CNF
        negated = Negation(formula)
        raw_clauses = cnf.to_clauses(negated)
        
        unprocessed = []
        for rc in raw_clauses:
            cl = [Literal(f) for f in rc]
            if not is_tautology(cl):
                unprocessed.append(cl)
        
        processed = []
        clauses_gen = len(unprocessed)

        while unprocessed:
            elapsed = (time.time() - start_time) * 1000.0
            if elapsed > self.timeout_ms:
                return False, {"steps": steps, "clauses_gen": clauses_gen, "subsumptions": subsumptions, "time_ms": elapsed}
            
            # Select "given clause" (heuristic: smallest)
            unprocessed.sort(key=len)
            given = unprocessed.pop(0)
            
            if not given:
                elapsed = (time.time() - start_time) * 1000.0
                return True, {"steps": steps, "clauses_gen": clauses_gen, "subsumptions": subsumptions, "time_ms": elapsed}
            
            # Forward subsumption
            if any(subsumes(p, given) for p in processed):
                continue
            
            steps += 1
            
            # Backward subsumption
            old_processed_count = len(processed)
            processed = [p for p in processed if not subsumes(given, p)]
            subsumptions += (old_processed_count - len(processed))
            
            # Generate new resolvents
            newborns = []
            for p in processed:
                newborns.extend(resolve(given, p))
            
            # Generate factors
            newborns.extend(factor(given))
            
            clauses_gen += len(newborns)
            
            for r in newborns:
                if not r:
                    elapsed = (time.time() - start_time) * 1000.0
                    return True, {"steps": steps, "clauses_gen": clauses_gen, "subsumptions": subsumptions, "time_ms": elapsed}
                
                if not is_tautology(r) and \
                   not any(subsumes(p, r) for p in processed) and \
                   not any(subsumes(u, r) for u in unprocessed):
                    unprocessed.append(r)
            
            processed.append(given)

        elapsed = (time.time() - start_time) * 1000.0
        return False, {"steps": steps, "clauses_gen": clauses_gen, "subsumptions": subsumptions, "time_ms": elapsed}
