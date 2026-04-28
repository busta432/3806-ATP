from typing import List, Dict, Set, Any
from fol_types import Term, Atom, Variable, Constant, Function, Formula

class FingerprintIndex:
    """
    A term indexing structure to reduce the number of unification attempts.
    Uses Top-Symbol abstraction for quick candidate retrieval.
    """
    def __init__(self):
        # Maps (predicate_name, arity) -> List of Formulas
        self.index: Dict[tuple[str, int], List[Formula]] = {}

    def insert(self, formula: Formula):
        """Index a literal by its top-level predicate and arity."""
        if isinstance(formula, Atom):
            key = (formula.predicate, len(formula.args))
            if key not in self.index:
                self.index[key] = []
            self.index[key].append(formula)

    def query(self, formula: Formula) -> List[Formula]:
        """Retrieve candidate formulas that share the same top-level symbol."""
        if isinstance(formula, Atom):
            key = (formula.predicate, len(formula.args))
            return self.index.get(key, [])
        return []

    def clear(self):
        self.index.clear()
