"""
formula_utils.py — Core formula manipulation operations.
Ported from formula.ml.
"""

from fol_types import (
    Term, Variable, Constant, Function,
    Formula, Atom, Negation, BinaryOp, Connective,
    QuantifiedFormula, Quantifier
)

def term_vars(t: Term) -> list[str]:
    """Free variables of a term."""
    if isinstance(t, Variable):
        return [t.name]
    if isinstance(t, Function):
        vars_list = []
        for arg in t.args:
            vars_list.extend(term_vars(arg))
        return vars_list
    return []

def free_vars(f: Formula) -> list[str]:
    """Free variables of a formula (respecting quantifier binding)."""
    if isinstance(f, Atom):
        vars_list = []
        for arg in f.args:
            vars_list.extend(term_vars(arg))
        return vars_list
    if isinstance(f, Negation):
        return free_vars(f.formula)
    if isinstance(f, BinaryOp):
        return free_vars(f.left) + free_vars(f.right)
    if isinstance(f, QuantifiedFormula):
        return [v for v in free_vars(f.body) if v != f.variable.name]
    return []

def unique(lst):
    """Remove duplicates from a list, preserving order."""
    seen = set()
    return [x for x in lst if not (x in seen or seen.add(x))]

def free_vars_unique(f: Formula) -> list[str]:
    return unique(free_vars(f))

def variant(x: str, avoid: list[str]) -> str:
    """Generate a fresh variable name that doesn't clash with any in [avoid]."""
    while x in avoid:
        x += "'"
    return x

def simplify(f: Formula) -> Formula:
    """Simplify a formula by eliminating trivial subformulae."""
    if isinstance(f, Negation):
        sub = simplify(f.formula)
        if isinstance(sub, Atom):
            if sub.predicate == "⊤": return Atom("⊥")
            if sub.predicate == "⊥": return Atom("⊤")
        if isinstance(sub, Negation):
            return simplify(sub.formula)
        return Negation(sub)
    
    if isinstance(f, BinaryOp):
        left = simplify(f.left)
        right = simplify(f.right)
        
        if f.connective == Connective.AND:
            if isinstance(left, Atom) and left.predicate == "⊤": return right
            if isinstance(right, Atom) and right.predicate == "⊤": return left
            if isinstance(left, Atom) and left.predicate == "⊥": return Atom("⊥")
            if isinstance(right, Atom) and right.predicate == "⊥": return Atom("⊥")
            if left == right: return left
            return BinaryOp(Connective.AND, left, right)
            
        if f.connective == Connective.OR:
            if isinstance(left, Atom) and left.predicate == "⊤": return Atom("⊤")
            if isinstance(right, Atom) and right.predicate == "⊤": return Atom("⊤")
            if isinstance(left, Atom) and left.predicate == "⊥": return right
            if isinstance(right, Atom) and right.predicate == "⊥": return left
            if left == right: return left
            return BinaryOp(Connective.OR, left, right)
            
        if f.connective == Connective.IMPLIES:
            if isinstance(left, Atom) and left.predicate == "⊤": return right
            if isinstance(right, Atom) and right.predicate == "⊤": return Atom("⊤")
            if isinstance(left, Atom) and left.predicate == "⊥": return Atom("⊤")
            if isinstance(right, Atom) and right.predicate == "⊥": return simplify(Negation(left))
            return BinaryOp(Connective.IMPLIES, left, right)
            
        if f.connective == Connective.IFF:
            if isinstance(left, Atom) and left.predicate == "⊤": return right
            if isinstance(right, Atom) and right.predicate == "⊤": return left
            if isinstance(left, Atom) and left.predicate == "⊥": return simplify(Negation(right))
            if isinstance(right, Atom) and right.predicate == "⊥": return simplify(Negation(left))
            if left == right: return Atom("⊤")
            return BinaryOp(Connective.IFF, left, right)
            
    if isinstance(f, QuantifiedFormula):
        body = simplify(f.body)
        if f.variable.name not in free_vars(body):
            return body
        return QuantifiedFormula(f.quantifier, f.variable, body)
        
    return f

def nnf(f: Formula) -> Formula:
    """Convert a formula to Negation Normal Form."""
    if isinstance(f, Atom):
        return f
    if isinstance(f, Negation):
        if isinstance(f.formula, Negation):
            return nnf(f.formula.formula)
        if isinstance(f.formula, Atom):
            if f.formula.predicate == "⊤": return Atom("⊥")
            if f.formula.predicate == "⊥": return Atom("⊤")
            return f
        if isinstance(f.formula, BinaryOp):
            if f.formula.connective == Connective.AND:
                return BinaryOp(Connective.OR, nnf(Negation(f.formula.left)), nnf(Negation(f.formula.right)))
            if f.formula.connective == Connective.OR:
                return BinaryOp(Connective.AND, nnf(Negation(f.formula.left)), nnf(Negation(f.formula.right)))
            if f.formula.connective == Connective.IMPLIES:
                return BinaryOp(Connective.AND, nnf(f.formula.left), nnf(Negation(f.formula.right)))
            if f.formula.connective == Connective.IFF:
                return BinaryOp(Connective.OR, 
                                BinaryOp(Connective.AND, nnf(f.formula.left), nnf(Negation(f.formula.right))),
                                BinaryOp(Connective.AND, nnf(Negation(f.formula.left)), nnf(f.formula.right)))
        if isinstance(f.formula, QuantifiedFormula):
            if f.formula.quantifier == Quantifier.FORALL:
                return QuantifiedFormula(Quantifier.EXISTS, f.formula.variable, nnf(Negation(f.formula.body)))
            if f.formula.quantifier == Quantifier.EXISTS:
                return QuantifiedFormula(Quantifier.FORALL, f.formula.variable, nnf(Negation(f.formula.body)))
    if isinstance(f, BinaryOp):
        if f.connective == Connective.AND:
            return BinaryOp(Connective.AND, nnf(f.left), nnf(f.right))
        if f.connective == Connective.OR:
            return BinaryOp(Connective.OR, nnf(f.left), nnf(f.right))
        if f.connective == Connective.IMPLIES:
            return BinaryOp(Connective.OR, nnf(Negation(f.left)), nnf(f.right))
        if f.connective == Connective.IFF:
            return BinaryOp(Connective.AND,
                            BinaryOp(Connective.OR, nnf(Negation(f.left)), nnf(f.right)),
                            BinaryOp(Connective.OR, nnf(Negation(f.right)), nnf(f.left)))
    if isinstance(f, QuantifiedFormula):
        return QuantifiedFormula(f.quantifier, f.variable, nnf(f.body))
    return f

def term_equal(t1: Term, t2: Term) -> bool:
    return t1 == t2

def formula_equal(f1: Formula, f2: Formula) -> bool:
    return f1 == f2

def functions_of(f: Formula) -> list[tuple[str, int]]:
    """All function symbols in a formula with their arities."""
    if isinstance(f, Atom):
        fs = []
        for arg in f.args:
            fs.extend(term_functions(arg))
        return fs
    if isinstance(f, Negation):
        return functions_of(f.formula)
    if isinstance(f, BinaryOp):
        return functions_of(f.left) + functions_of(f.right)
    if isinstance(f, QuantifiedFormula):
        return functions_of(f.body)
    return []

def term_functions(t: Term) -> list[tuple[str, int]]:
    if isinstance(t, Variable):
        return []
    if isinstance(t, Function):
        fs = [(t.name, len(t.args))]
        for arg in t.args:
            fs.extend(term_functions(arg))
        return fs
    if isinstance(t, Constant):
        return [(t.name, 0)]
    return []

def term_complexity(t: Term) -> int:
    """Number of symbols in a term."""
    if isinstance(t, (Variable, Constant)):
        return 1
    if isinstance(t, Function):
        return 1 + sum(term_complexity(arg) for arg in t.args)
    return 1

def formula_complexity(f: Formula) -> int:
    """
    Calculate a complexity score for a formula.
    Heuristic: sum of symbols + (10 * quantifier depth).
    """
    if isinstance(f, Atom):
        return 1 + sum(term_complexity(arg) for arg in f.args)
    if isinstance(f, Negation):
        return 1 + formula_complexity(f.formula)
    if isinstance(f, BinaryOp):
        return 1 + formula_complexity(f.left) + formula_complexity(f.right)
    if isinstance(f, QuantifiedFormula):
        return 10 + formula_complexity(f.body)
    return 1

def constants_of(f: Formula) -> list[str]:
    return unique([name for name, arity in functions_of(f) if arity == 0])
