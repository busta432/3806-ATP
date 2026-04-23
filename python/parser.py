"""
Syntax :
  Variables   : single lowercase letter, optionally subscripted  e.g.  x  y  z  x1
  Constants   : lowercase identifier starting with a–f or 'a'–'z' but not a pred
                OR any identifier used as a 0-ary function       e.g.  a  b  c  alice
  Predicates  : uppercase letter / identifier                     e.g.  P  Q  Human
  Functions   : lowercase identifier followed by (...)            e.g.  f(x)  succ(x)
  Connectives : &  (∧)   |  (∨)   ->  (→)   ~  (¬)
  Quantifiers : A. (∀)   E. (∃)            
  Special     : True (⊤)   False (⊥)
  Grouping    : parentheses

Operator Precedence (tightest to loosest):
  ~ (negation)  >  & (and)  >  | (or)  >  -> (implies)

Input file format:
  One formula per line.  Blank lines and lines starting with # are ignored.
"""

from __future__ import annotations
from os import name
from lark import Lark, Transformer, Token, Tree 
from lark.exceptions import UnexpectedInput
from pymupdf import name
from fol_types import (
    Term, Variable, Constant, Function,
    Formula, Atom, Negation, BinaryOp, Connective,
    QuantifiedFormula, Quantifier,
)

# ─────────────────────────────────────────────
#  GRAMMAR
# ─────────────────────────────────────────────

FOL_GRAMMAR = r"""
    // Top-level
    formula : implies #Not sure I understand why we need this extra layer.
    // Precedence: implies < or < and < neg < atom/paren # 
    implies : or ("->" or)+                        -> implies
            | or

    or      : and ("|" and)+                       -> or_
            | and

    and     : neg ("&" neg)+                       -> and_
            | neg

    neg     : "~" neg                              -> negation
            | quantified

    quantified : "A." VARNAME formula              -> forall
               | "E." VARNAME formula              -> exists
               | primary

    primary : "True"                               -> top
            | "False"                              -> bot
            | PREDNAME "(" arglist ")"             -> atom_args
            | PREDNAME                             -> atom_no_args
            | "(" formula ")"                      -> paren

    arglist : term ("," term)*

    term    : FUNCNAME "(" arglist ")"             -> func
            | VARNAME                              -> var_or_const
            | CONSTNAME                            -> constant

    // Lexer rules
    // Predicates: start with uppercase
    PREDNAME  : /[A-Z][a-zA-Z0-9_]*/

    // Functions: lowercase, followed by '(' — disambiguated in transformer
    FUNCNAME  : /[a-z][a-zA-Z0-9_]*/

    // Variables: single letter (optionally followed by digits)
    VARNAME   : /[a-z][0-9]*/

    // Constants: multi-char lowercase identifiers (alice, bob, zero, etc.)
    CONSTNAME : /[a-z][a-zA-Z][a-zA-Z0-9_]*/

    %ignore /\s+/
    %ignore /\/\/[^\n]*/
"""

# ─────────────────────────────────────────────
#  TRANSFORMER  (parse tree → data structures)
# ─────────────────────────────────────────────

class FOLTransformer(Transformer):
    """
    Walks the Lark parse tree bottom-up and builds our
    Term / Formula objects.

    `bound_vars` tracks which variable names are currently
    bound by an enclosing quantifier — this lets us
    distinguish  x  (variable, bound)  from  x  (constant, free)
    when the lexer can't tell them apart.

    Would assume that there is a better way to handle this.
    This is just prototype code before OCaml implementation so creating a 
    quicker prototyping environment was the priority.
    """

    def __init__(self):
        super().__init__()
        self._bound: set[str] = set()   # names currently in quantifier scope

    # ── Terms ──────────────────────────────────────────────
        
    
    def var_or_const(self, items) -> Term:
        name = str(items[0])
    # If this name is currently bound by a quantifier → Variable
    # Otherwise it's a free name → treat as Constant
    # Ensure it's a single char a-z or a char followed by digits
        if len(name) >= 1 or (len(name) > 1 and name[1:].isdigit()): #Changed if len(name) from == 1 to >= 1 and passed 62/62 tests for test_parser.py.
            return Variable(name)
        return Constant(name)

    def constant(self, items) -> Constant:
        return Constant(str(items[0]))

    def func(self, items) -> Function:
        name = str(items[0])
        args = tuple(items[1])          # items[1] is the arglist result
        return Function(name, args)

    def arglist(self, items) -> list[Term]:
        return list(items)

    # ── Atoms ──────────────────────────────────────────────

    def top(self, _) -> Atom:
        return Atom("⊤")

    def bot(self, _) -> Atom:
        return Atom("⊥")

    def atom_no_args(self, items) -> Atom:
        return Atom(str(items[0]))

    def atom_args(self, items) -> Atom:
        pred = str(items[0])
        args = tuple(items[1])          # items[1] is the arglist result
        return Atom(pred, args)

    # ── Connectives ────────────────────────────────────────

    def negation(self, items) -> Negation:
        return Negation(items[0])

    def and_(self, items) -> Formula:
        # items may be [A, B, C] — fold left: ((A & B) & C)
        result = items[0]
        for right in items[1:]:
            result = BinaryOp(Connective.AND, result, right)
        return result

    def or_(self, items) -> Formula:
        result = items[0]
        for right in items[1:]:
            result = BinaryOp(Connective.OR, result, right)
        return result

    def implies(self, items) -> Formula:
        # Right-associative:  A -> B -> C  =  A -> (B -> C)
        result = items[-1]
        for left in reversed(items[:-1]):
            result = BinaryOp(Connective.IMPLIES, left, result)
        return result

    def paren(self, items) -> Formula:
        return items[0]

    # ── Quantifiers ────────────────────────────────────────

    def forall(self, items) -> QuantifiedFormula:
        var_name = str(items[0])
        self._bound.discard(var_name)   # clean up after recursion
        body     = items[1]
        return QuantifiedFormula(Quantifier.FORALL, Variable(var_name), body)

    def exists(self, items) -> QuantifiedFormula:
        var_name = str(items[0])
        self._bound.discard(var_name)
        body     = items[1]
        return QuantifiedFormula(Quantifier.EXISTS, Variable(var_name), body)

    def formula(self, items) -> Formula:
        return items[0]

    def quantified(self, items) -> Formula:
        return items[0]

    def primary(self, items) -> Formula:
        return items[0]

    def neg(self, items) -> Formula:
        return items[0]

    def or_rule(self, items) -> Formula:
        return items[0]

    def and_rule(self, items) -> Formula:
        return items[0]

    # Override to register bound variables BEFORE the body is parsed.
    # Lark calls __default__ for rules not matched above.
    def __default__(self, data, children, meta):
        return children[0] if len(children) == 1 else children


# ─────────────────────────────────────────────
#  PRE-PROCESSING PASS FOR BOUND VARIABLES
# ─────────────────────────────────────────────
# The transformer above handles most cases correctly because lark
# resolves the token type (VARNAME vs CONSTNAME) before we see it.
# Single-char names match VARNAME; multi-char match CONSTNAME.
# The _bound set guards the edge case where a single-char name
# appears both free and bound in different sub-formulae.

def _register_bound(tree: Tree, bound: set[str]) -> None:
    """Walk the parse tree first-pass to collect all bound variable names."""
    if isinstance(tree, Tree):
        if tree.data in ("forall", "exists"):
            varname = str(tree.children[0])
            bound.add(varname)
        for child in tree.children:
            _register_bound(child, bound)


# ─────────────────────────────────────────────
#  PUBLIC API
# ─────────────────────────────────────────────

_parser = Lark(
    FOL_GRAMMAR,
    start="formula",
    parser="earley",        # handles ambiguous / left-recursive grammars safely
    ambiguity="resolve",
)


def parse_formula(text: str) -> Formula:
    """
    Parse a single FOL formula string and return a Formula object.

    Raises ParseError (a subclass of ValueError) on invalid input.
    """
    text = text.strip()
    if not text:
        raise ValueError("Empty formula string")
    try:
        tree = _parser.parse(text)
    except UnexpectedInput as e:
        raise ParseError(f"Syntax error in formula: {text!r}\n  {e}") from e

    # Pre-pass: collect all bound variable names so the transformer
    # can correctly classify single-char identifiers
    bound: set[str] = set()
    _register_bound(tree, bound)

    transformer = FOLTransformer()
    transformer._bound = bound
    return transformer.transform(tree)


def parse_file(path: str) -> list[Formula]:
    """
    Read a file containing one FOL formula per line.
    Blank lines and lines starting with # are ignored.
    Returns a list of Formula objects.
    """
    formulae: list[Formula] = []
    with open(path, "r", encoding="utf-8") as f:
        for lineno, raw in enumerate(f, start=1):
            line = raw.strip()
            if not line or line.startswith("#"):
                continue
            try:
                formulae.append(parse_formula(line))
            except ParseError as e:
                raise ParseError(f"Line {lineno}: {e}") from e
    return formulae


class ParseError(ValueError):
    """Raised when a formula string cannot be parsed."""
    pass


# ─────────────────────────────────────────────
#  SMOKE TEST
# ─────────────────────────────────────────────

if __name__ == "__main__":
    cases = [
        # Atoms
        ("P",                       "P"),
        ("P(x)",                    "P(x)"),
        ("P(x,y)",                  "P(x, y)"),
        ("Human(alice)",            "Human(alice)"),
        # Connectives
        ("~P",                      "¬P"),
        ("P & Q",                   "(P ∧ Q)"),
        ("P | Q",                   "(P ∨ Q)"),
        ("P -> Q",                  "(P → Q)"),
        ("P -> Q -> R",             "(P → (Q → R))"),   # right-assoc
        ("P & Q | R",               "((P ∧ Q) ∨ R)"),   # precedence
        ("~P & Q",                  "(¬P ∧ Q)"),
        # Quantifiers
        ("A.x P(x)",                "∀x.P(x)"),
        ("E.x P(x)",                "∃x.P(x)"),
        ("A.x E.y P(x,y)",          "∀x.∃y.P(x, y)"),
        # Functions
        ("P(f(x))",                 "P(f(x))"),
        ("P(f(x,g(y)))",            "P(f(x, g(y)))"),
        # Mixed
        ("A.x (P(x) -> Q(x))",     "∀x.(P(x) → Q(x))"),
        ("A.x P(x) -> E.x Q(x)",   "(∀x.P(x) → ∃x.Q(x))"),
        # Special constants
        ("True",                    "⊤"),
        ("False",                   "⊥"),
    ]

    all_pass = True
    for src, expected_str in cases:
        try:
            result = parse_formula(src)
            status = "PASS" if str(result) == expected_str else "FAIL"
            if status == "FAIL":
                all_pass = False
                print(f"{status}  {src!r}")
                print(f"       expected: {expected_str}")
                print(f"       got:      {result}")
            else:
                print(f"{status}  {src!r:40s} -> {result}")
        except Exception as e:
            all_pass = False
            print(f"ERR   {src!r}: {e}")

    print()
    print("All tests passed!" if all_pass else "Some tests FAILED.")