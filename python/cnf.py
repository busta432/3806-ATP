"""
cnf.py — CNF conversion pipeline for the Resolution Engine.
Ported from cnf.ml and formula.ml.
"""

from fol_types import (
    Term, Variable, Constant, Function,
    Formula, Atom, Negation, BinaryOp, Connective,
    QuantifiedFormula, Quantifier
)
from formula_utils import simplify, nnf, variant, free_vars

def skolemize(f: Formula) -> Formula:
    """Skolemize a formula in NNF."""
    counter = [0]
    
    def sk(univ_vars: list[Term], f: Formula) -> Formula:
        if isinstance(f, Atom):
            return f
        if isinstance(f, Negation):
            return Negation(sk(univ_vars, f.formula))
        if isinstance(f, BinaryOp):
            return BinaryOp(f.connective, sk(univ_vars, f.left), sk(univ_vars, f.right))
        if isinstance(f, QuantifiedFormula):
            if f.quantifier == Quantifier.FORALL:
                return QuantifiedFormula(Quantifier.FORALL, f.variable, sk(univ_vars + [f.variable], f.body))
            if f.quantifier == Quantifier.EXISTS:
                sk_name = f"sk_{counter[0]}"
                counter[0] += 1
                sk_term = Function(sk_name, tuple(univ_vars))
                # Substitute bound variable with skolem term
                body_prime = f.instantiate(sk_term)
                return sk(univ_vars, body_prime)
        return f

    return sk([], f)

def drop_forall(f: Formula) -> Formula:
    """Drop universal quantifiers (implicit quantification)."""
    if isinstance(f, QuantifiedFormula):
        if f.quantifier == Quantifier.FORALL:
            return drop_forall(f.body)
    if isinstance(f, BinaryOp):
        return BinaryOp(f.connective, drop_forall(f.left), drop_forall(f.right))
    return f

def distribute(f: Formula) -> Formula:
    """Distribute Or over And to reach Conjunctive Normal Form."""
    if isinstance(f, BinaryOp):
        if f.connective == Connective.AND:
            return BinaryOp(Connective.AND, distribute(f.left), distribute(f.right))
        if f.connective == Connective.OR:
            l = distribute(f.left)
            r = distribute(f.right)
            
            if isinstance(l, BinaryOp) and l.connective == Connective.AND:
                return BinaryOp(Connective.AND, distribute(BinaryOp(Connective.OR, l.left, r)), 
                                               distribute(BinaryOp(Connective.OR, l.right, r)))
            if isinstance(r, BinaryOp) and r.connective == Connective.AND:
                return BinaryOp(Connective.AND, distribute(BinaryOp(Connective.OR, l, r.left)), 
                                               distribute(BinaryOp(Connective.OR, l, r.right)))
            return BinaryOp(Connective.OR, l, r)
    return f

# For resolution, we need literals and clauses
# A Literal is a Pos or Neg predicate
# Since we already have Atom and Negation(Atom), we can use those or define a specific class.
# The user asked to define Resolution-specific types in resolution.py.
# So I'll just return lists of lists of formulas for now, and resolution.py will wrap them.

def clausify(f: Formula) -> list[list[Formula]]:
    """Convert a CNF formula to a list of clauses (disjunctions of literals)."""
    if isinstance(f, BinaryOp) and f.connective == Connective.AND:
        return clausify(f.left) + clausify(f.right)
    
    def literals(fm: Formula) -> list[Formula]:
        if isinstance(fm, BinaryOp) and fm.connective == Connective.OR:
            return literals(fm.left) + literals(fm.right)
        if isinstance(fm, Atom):
            if fm.predicate in ("⊤", "⊥"): return []
            return [fm]
        if isinstance(fm, Negation) and isinstance(fm.formula, Atom):
            return [fm]
        return []

    return [literals(f)]

def to_clauses(f: Formula) -> list[list[Formula]]:
    """The full transformation pipeline."""
    return clausify(distribute(drop_forall(skolemize(nnf(simplify(f))))))
