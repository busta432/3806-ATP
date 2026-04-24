#Data Strucutres for types

from __future__ import annotations
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Optional

# ─────────────────────────────────────────────
#  TERMS
# ─────────────────────────────────────────────

class Term:
    """Abstract base for all first-order terms."""

    def free_vars(self) -> set[str]:
        """Return all free variable names in this term."""
        raise NotImplementedError

    def substitute(self, var: str, replacement: "Term") -> "Term":
        """Return a new term with every occurrence of `var` replaced by `replacement`."""
        raise NotImplementedError

    def __eq__(self, other: object) -> bool:
        raise NotImplementedError

    def __hash__(self) -> int:
        raise NotImplementedError


@dataclass(frozen=True)
class Variable(Term):
    """A logical variable, e.g. x, y, z."""
    name: str

    def free_vars(self) -> set[str]:
        return {self.name}

    def substitute(self, var: str, replacement: Term) -> Term:
        return replacement if self.name == var else self

    def __str__(self) -> str:
        return self.name

    def __repr__(self) -> str:
        return f"Var({self.name})"


@dataclass(frozen=True)
class Constant(Term):
    """A constant (ground term), e.g. a, b, c0, fresh_0."""
    name: str

    def free_vars(self) -> set[str]:
        return set()

    def substitute(self, var: str, replacement: Term) -> "Constant":
        return self  # constants have no variables to replace

    def __str__(self) -> str:
        return self.name

    def __repr__(self) -> str:
        return f"Const({self.name})"


@dataclass(frozen=True)
class Function(Term):
    """
    A function application f(t1, ..., tn).
    0-ary functions are equivalent to constants but kept separate for clarity.
    """
    name: str
    args: tuple[Term, ...]  # tuple so the dataclass stays hashable

    def free_vars(self) -> set[str]:
        result: set[str] = set()
        for arg in self.args:
            result |= arg.free_vars()
        return result

    def substitute(self, var: str, replacement: Term) -> "Function":
        return Function(self.name, tuple(a.substitute(var, replacement) for a in self.args))

    def __str__(self) -> str:
        if not self.args:
            return self.name
        return f"{self.name}({', '.join(str(a) for a in self.args)})"

    def __repr__(self) -> str:
        return f"Fn({self.name}, {self.args})"


# ─────────────────────────────────────────────
#  FORMULAE
# ─────────────────────────────────────────────

class Formula:
    """Abstract base for all first-order formulae."""

    def free_vars(self) -> set[str]:
        raise NotImplementedError

    def substitute(self, var: str, replacement: Term) -> "Formula":
        """Return a copy of this formula with `var` replaced by `replacement`."""
        raise NotImplementedError

    def is_literal(self) -> bool:
        """True if this formula is an atom or negation of an atom."""
        return False


@dataclass(frozen=True)
class Atom(Formula):
    """
    An atomic formula P(t1, ..., tn).
    Also handles propositional atoms (0-ary predicates).
    Special names: '⊤' (Top/True) and '⊥' (Bottom/False).
    """
    predicate: str
    args: tuple[Term, ...] = field(default_factory=tuple)

    def free_vars(self) -> set[str]:
        result: set[str] = set()
        for arg in self.args:
            result |= arg.free_vars()
        return result

    def substitute(self, var: str, replacement: Term) -> "Atom":
        return Atom(self.predicate, tuple(a.substitute(var, replacement) for a in self.args))

    def is_literal(self) -> bool:
        return True

    def __str__(self) -> str:
        if not self.args:
            return self.predicate
        return f"{self.predicate}({', '.join(str(a) for a in self.args)})"

    def __repr__(self) -> str:
        return f"Atom({self.predicate}, {self.args})"


@dataclass(frozen=True)
class Negation(Formula):
    """¬φ"""
    formula: Formula

    def free_vars(self) -> set[str]:
        return self.formula.free_vars()

    def substitute(self, var: str, replacement: Term) -> "Negation":
        return Negation(self.formula.substitute(var, replacement))

    def is_literal(self) -> bool:
        return isinstance(self.formula, Atom)

    def __str__(self) -> str:
        return f"¬{self.formula}"

    def __repr__(self) -> str:
        return f"Neg({self.formula!r})"


class Connective(Enum):
    AND     = auto()   # ∧
    OR      = auto()   # ∨
    IMPLIES = auto()   # →
    IFF     = auto()   # ↔


@dataclass(frozen=True)
class BinaryOp(Formula):
    """φ ∧ ψ  /  φ ∨ ψ  /  φ → ψ  /  φ ↔ ψ"""
    connective: Connective
    left: Formula
    right: Formula

    def free_vars(self) -> set[str]:
        return self.left.free_vars() | self.right.free_vars()

    def substitute(self, var: str, replacement: Term) -> "BinaryOp":
        return BinaryOp(
            self.connective,
            self.left.substitute(var, replacement),
            self.right.substitute(var, replacement),
        )

    def __str__(self) -> str:
        symbol = {
            Connective.AND: "∧", 
            Connective.OR: "∨", 
            Connective.IMPLIES: "→",
            Connective.IFF: "↔"
        }[self.connective]
        return f"({self.left} {symbol} {self.right})"

    def __repr__(self) -> str:
        return f"BinOp({self.connective.name}, {self.left!r}, {self.right!r})"


class Quantifier(Enum):
    FORALL = auto()   # ∀
    EXISTS = auto()   # ∃


@dataclass(frozen=True)
class QuantifiedFormula(Formula):
    """∀x.φ  /  ∃x.φ"""
    quantifier: Quantifier
    variable: Variable
    body: Formula

    def free_vars(self) -> set[str]:
        # The variable is bound here, so remove it from the body's free vars
        return self.body.free_vars() - {self.variable.name}

    def substitute(self, var: str, replacement: Term) -> "QuantifiedFormula":
        # Do not substitute the bound variable itself
        if var == self.variable.name:
            return self
        return QuantifiedFormula(
            self.quantifier,
            self.variable,
            self.body.substitute(var, replacement),
        )

    def instantiate(self, term: Term) -> Formula:
        """Replace the bound variable with `term` — used by ∀L and ∃R rules."""
        return self.body.substitute(self.variable.name, term)

    def __str__(self) -> str:
        q = "∀" if self.quantifier == Quantifier.FORALL else "∃"
        return f"{q}{self.variable}.{self.body}"

    def __repr__(self) -> str:
        return f"Quant({self.quantifier.name}, {self.variable!r}, {self.body!r})"


# ─────────────────────────────────────────────
#  SEQUENT
# ─────────────────────────────────────────────

@dataclass
class Sequent:
    """
    A sequent  Γ ⊢ Δ  where:
      - antecedent (Γ): formulae on the LEFT of the turnstile
      - succedent  (Δ): formulae on the RIGHT of the turnstile

    Stored as lists (not sets) to preserve rule-application order.
    """
    antecedent: list[Formula] = field(default_factory=list)
    succedent:  list[Formula] = field(default_factory=list)

    def is_axiomatic(self) -> bool:
        """
        Check if this sequent is immediately closeable:
          - id rule:  some atom A appears on both sides
          - ⊤R rule:  ⊤ (Top) appears in the succedent
          - ⊥L rule:  ⊥ (Bottom) appears in the antecedent
        """
        # ⊤R
        if any(isinstance(f, Atom) and f.predicate == "⊤" for f in self.succedent):
            return True
        # ⊥L
        if any(isinstance(f, Atom) and f.predicate == "⊥" for f in self.antecedent):
            return True
        # id: same atom on both sides
        left_atoms  = {f for f in self.antecedent if isinstance(f, Atom)}
        right_atoms = {f for f in self.succedent  if isinstance(f, Atom)}
        return bool(left_atoms & right_atoms)

    def all_terms(self) -> set[Term]:
        """Collect every ground term appearing in the sequent (for ∀L / ∃R instantiation)."""
        terms: set[Term] = set()
        for formula in self.antecedent + self.succedent:
            terms |= _collect_terms(formula)
        return terms

    def __str__(self) -> str:
        lhs = ", ".join(str(f) for f in self.antecedent) or "∅"
        rhs = ", ".join(str(f) for f in self.succedent)  or "∅"
        return f"{lhs} ⊢ {rhs}"

    def __repr__(self) -> str:
        return f"Sequent({self.antecedent!r}, {self.succedent!r})"


def _collect_terms(formula: Formula) -> set[Term]:
    """Recursively gather all Term objects from a formula."""
    if isinstance(formula, Atom):
        terms: set[Term] = set()
        for arg in formula.args:
            terms |= _collect_subterms(arg)
        return terms
    if isinstance(formula, Negation):
        return _collect_terms(formula.formula)
    if isinstance(formula, BinaryOp):
        return _collect_terms(formula.left) | _collect_terms(formula.right)
    if isinstance(formula, QuantifiedFormula):
        return _collect_terms(formula.body) - {formula.variable}
    return set()


def _collect_subterms(term: Term) -> set[Term]:
    """Recursively gather a term and all its sub-terms."""
    if isinstance(term, (Variable, Constant)):
        return {term}
    if isinstance(term, Function):
        result: set[Term] = {term}
        for arg in term.args:
            result |= _collect_subterms(arg)
        return result
    return set()


# ─────────────────────────────────────────────
#  BRANCH
# ─────────────────────────────────────────────

@dataclass
class Branch:
    """
    Represents one open branch in the proof tree.

    `used_terms` tracks which terms have already been used to instantiate
    a ∀L or ∃R formula on this branch — this is the set the algorithm
    checks before deciding to create a fresh term.
    """
    sequent:    Sequent
    used_terms: set[Term]  = field(default_factory=set)
    is_closed:  bool       = False

    def close(self) -> None:
        self.is_closed = True

    def mark_term_used(self, term: Term) -> None:
        self.used_terms.add(term)

    def has_used(self, term: Term) -> bool:
        return term in self.used_terms

    def available_terms(self) -> set[Term]:
        """
        Ground terms in the current sequent that haven't been used yet
        for instantiation on this branch.
        """
        return self.sequent.all_terms() - self.used_terms

    def __str__(self) -> str:
        status = "closed" if self.is_closed else "open"
        return f"Branch[{status}]: {self.sequent}"

    def __repr__(self) -> str:
        return (f"Branch(sequent={self.sequent!r}, "
                f"used_terms={self.used_terms!r}, "
                f"is_closed={self.is_closed})")


# ─────────────────────────────────────────────
#  DERIVATION TREE
# ─────────────────────────────────────────────

@dataclass
class DerivationTree:
    """
    A node in the completed proof tree.

      sequent:       the sequent at this node
      rule_applied:  name of the LK' rule used (e.g. '∧R', '∀L', 'id')
                     None at leaves that are still open
      children:      sub-trees produced by applying the rule
    """
    sequent:      Sequent
    rule_applied: Optional[str]              = None
    children:     list["DerivationTree"]     = field(default_factory=list)

    def is_closed(self) -> bool:
        """
        A tree is closed (i.e. a complete proof) when:
          - it is a leaf AND was closed by an axiom rule, OR
          - all children are themselves closed.
        """
        if not self.children:
            # Leaf: closed iff an axiom rule was applied
            return self.rule_applied in ("id", "⊤R", "⊥L")
        return all(child.is_closed() for child in self.children)

    def is_open(self) -> bool:
        return not self.is_closed()

    def open_leaves(self) -> list["DerivationTree"]:
        """Return all leaf nodes that are not yet closed."""
        if not self.children:
            return [] if self.is_closed() else [self]
        result = []
        for child in self.children:
            result.extend(child.open_leaves())
        return result

    def depth(self) -> int:
        if not self.children:
            return 0
        return 1 + max(child.depth() for child in self.children)

    def pretty(self, indent: int = 0) -> str:
        """Return a human-readable, indented representation of the tree."""
        pad    = "  " * indent
        rule   = f"  [{self.rule_applied}]" if self.rule_applied else ""
        lines  = [f"{pad}{self.sequent}{rule}"]
        for child in self.children:
            lines.append(child.pretty(indent + 1))
        return "\n".join(lines)

    def __str__(self) -> str:
        return self.pretty()

    def __repr__(self) -> str:
        return (f"DerivationTree(sequent={self.sequent!r}, "
                f"rule={self.rule_applied!r}, "
                f"children={self.children!r})")


# ─────────────────────────────────────────────
#  FRESH TERM GENERATOR
# ─────────────────────────────────────────────

class FreshTermGenerator:
    """
    Produces unique fresh constants for the ∀L / ∃R rule cases
    where no suitable existing term is available.
    e.g.  c0, c1, c2, ...
    """
    def __init__(self, prefix: str = "c") -> None:
        self._prefix  = prefix
        self._counter = 0

    def next(self) -> Constant:
        name = f"{self._prefix}{self._counter}"
        self._counter += 1
        return Constant(name)

    def reset(self) -> None:
        self._counter = 0


# ─────────────────────────────────────────────
#  TEST
# ─────────────────────────────────────────────

"""Santiy check to verify the data structures work as expected. 
 Needs to be deleted before submission"""

if __name__ == "__main__":
    # Build:  ∀x. P(x) ⊢ P(a)
    x   = Variable("x")
    a   = Constant("a")
    Px  = Atom("P", (x,))
    Pa  = Atom("P", (a,))
    all_x_Px = QuantifiedFormula(Quantifier.FORALL, x, Px)

    seq = Sequent(antecedent=[all_x_Px], succedent=[Pa])
    print("Sequent:       ", seq)
    print("Is axiomatic?: ", seq.is_axiomatic())   # False — needs a rule step
    print("All terms:     ", seq.all_terms())

    branch = Branch(sequent=seq)
    print("Branch:        ", branch)
    print("Available terms:", branch.available_terms())

    # Manually simulate one step: instantiate ∀x.P(x) with 'a'
    Pa_inst = all_x_Px.instantiate(a)
    seq2    = Sequent(antecedent=[Pa_inst], succedent=[Pa])
    print("\nAfter ∀L with a:", seq2)
    print("Is axiomatic?:  ", seq2.is_axiomatic())  # True — id rule applies

    # Build a tiny closed derivation tree
    leaf = DerivationTree(sequent=seq2, rule_applied="id")
    root = DerivationTree(sequent=seq, rule_applied="∀L", children=[leaf])
    print("\nProof tree:")
    print(root.pretty())
    print("Proof closed?:", root.is_closed())

    gen = FreshTermGenerator()
    print("\nFresh terms:", gen.next(), gen.next(), gen.next())