"""
unification.py — First-order unification algorithm.
Ported from unification.ml.
"""

from fol_types import Term, Variable, Function, Constant, Formula, Atom, Negation, BinaryOp, QuantifiedFormula

Substitution = dict[str, Term]

def apply(sigma: Substitution, t: Term) -> Term:
    """Apply a substitution to a term (chase variable bindings)."""
    if isinstance(t, Variable):
        if t.name in sigma:
            return apply(sigma, sigma[t.name])
        return t
    if isinstance(t, Function):
        return Function(t.name, tuple(apply(sigma, arg) for arg in t.args))
    return t

def apply_to_formula(sigma: Substitution, f: Formula) -> Formula:
    """Apply a substitution to a formula."""
    if isinstance(f, Atom):
        return Atom(f.predicate, tuple(apply(sigma, arg) for arg in f.args))
    if isinstance(f, Negation):
        return Negation(apply_to_formula(sigma, f.formula))
    if isinstance(f, BinaryOp):
        return BinaryOp(f.connective, apply_to_formula(sigma, f.left), apply_to_formula(sigma, f.right))
    if isinstance(f, QuantifiedFormula):
        return QuantifiedFormula(f.quantifier, f.variable, apply_to_formula(sigma, f.body))
    return f

def occurs(x: str, sigma: Substitution, t: Term) -> bool:
    """Check if variable x occurs in term t (after applying sigma)."""
    if isinstance(t, Variable):
        if x == t.name:
            return True
        if t.name in sigma:
            return occurs(x, sigma, sigma[t.name])
        return False
    if isinstance(t, Function):
        return any(occurs(x, sigma, arg) for arg in t.args)
    return False

def unify(sigma: Substitution, pairs: list[tuple[Term, Term]], is_substitutable=None) -> Substitution | None:
    """Unify a list of term pairs under the current substitution."""
    if not pairs:
        return sigma
    
    s, t = pairs[0]
    rest = pairs[1:]
    
    s_prime = apply(sigma, s)
    t_prime = apply(sigma, t)
    
    return unify_terms(sigma, s_prime, t_prime, rest, is_substitutable)

def unify_terms(sigma: Substitution, s: Term, t: Term, rest: list[tuple[Term, Term]], is_substitutable=None) -> Substitution | None:
    if s == t:
        return unify(sigma, rest, is_substitutable)
    
    if isinstance(s, Variable):
        if is_substitutable is None or is_substitutable(s.name):
            if occurs(s.name, sigma, t):
                return None
            new_sigma = sigma.copy()
            new_sigma[s.name] = t
            return unify(new_sigma, rest, is_substitutable)
    
    if isinstance(t, Variable):
        if is_substitutable is None or is_substitutable(t.name):
            if occurs(t.name, sigma, s):
                return None
            new_sigma = sigma.copy()
            new_sigma[t.name] = s
            return unify(new_sigma, rest, is_substitutable)
    
    if isinstance(s, Function) and isinstance(t, Function):
        if s.name != t.name or len(s.args) != len(t.args):
            return None
        new_pairs = list(zip(s.args, t.args)) + rest
        return unify(sigma, new_pairs, is_substitutable)
    
    return None

def unify_terms_fresh(s: Term, t: Term) -> Substitution | None:
    return unify({}, [(s, t)])
