"""
Test suite for the FOL parser.
Run with:  python -m pytest test_parser.py -v
       or: python test_parser.py
"""

import unittest
import tempfile
import os
from parser import parse_formula, parse_file, ParseError
from fol_types import (
    Atom, Negation, BinaryOp, Connective,
    QuantifiedFormula, Quantifier,
    Variable, Constant, Function,
)


# ─────────────────────────────────────────────
#  HELPERS
# ─────────────────────────────────────────────

def atom(pred, *args):
    return Atom(pred, tuple(args))

def var(name):
    return Variable(name)

def const(name):
    return Constant(name)

def func(name, *args):
    return Function(name, tuple(args))

def neg(f):
    return Negation(f)

def and_(l, r):
    return BinaryOp(Connective.AND, l, r)

def or_(l, r):
    return BinaryOp(Connective.OR, l, r)

def implies(l, r):
    return BinaryOp(Connective.IMPLIES, l, r)

def forall(v, body):
    return QuantifiedFormula(Quantifier.FORALL, Variable(v), body)

def exists(v, body):
    return QuantifiedFormula(Quantifier.EXISTS, Variable(v), body)


# ─────────────────────────────────────────────
#  TEST CASES
# ─────────────────────────────────────────────

class TestAtoms(unittest.TestCase):

    def test_propositional_atom(self):
        self.assertEqual(parse_formula("P"), atom("P"))

    def test_atom_single_var(self):
        self.assertEqual(parse_formula("P(x)"), atom("P", var("x")))

    def test_atom_multiple_vars(self):
        self.assertEqual(parse_formula("P(x,y)"), atom("P", var("x"), var("y")))

    def test_atom_constant_arg(self):
        # Single-char names are always Variables in our grammar.
        # Use multi-char names like "alice" for constants.
        self.assertEqual(parse_formula("P(a)"), atom("P", var("a")))

    def test_atom_named_constant(self):
        self.assertEqual(parse_formula("Human(alice)"), atom("Human", const("alice")))

    def test_top(self):
        self.assertEqual(parse_formula("True"), atom("⊤"))

    def test_bot(self):
        self.assertEqual(parse_formula("False"), atom("⊥"))

    def test_multichar_predicate(self):
        self.assertEqual(parse_formula("Mortal(x)"), atom("Mortal", var("x")))

    def test_atom_whitespace_ignored(self):
        self.assertEqual(parse_formula("  P(x)  "), atom("P", var("x")))


class TestNegation(unittest.TestCase):

    def test_simple_negation(self):
        self.assertEqual(parse_formula("~P"), neg(atom("P")))

    def test_double_negation(self):
        self.assertEqual(parse_formula("~~P"), neg(neg(atom("P"))))

    def test_negation_of_atom_with_args(self):
        self.assertEqual(parse_formula("~P(x)"), neg(atom("P", var("x"))))

    def test_negation_binds_tighter_than_and(self):
        # ~P & Q  should parse as  (~P) & Q,  not  ~(P & Q)
        result = parse_formula("~P & Q")
        self.assertEqual(result, and_(neg(atom("P")), atom("Q")))


class TestBinaryConnectives(unittest.TestCase):

    def test_and(self):
        self.assertEqual(parse_formula("P & Q"), and_(atom("P"), atom("Q")))

    def test_or(self):
        self.assertEqual(parse_formula("P | Q"), or_(atom("P"), atom("Q")))

    def test_implies(self):
        self.assertEqual(parse_formula("P -> Q"), implies(atom("P"), atom("Q")))

    def test_and_left_associative(self):
        # P & Q & R  =  (P & Q) & R
        result = parse_formula("P & Q & R")
        self.assertEqual(result, and_(and_(atom("P"), atom("Q")), atom("R")))

    def test_or_left_associative(self):
        result = parse_formula("P | Q | R")
        self.assertEqual(result, or_(or_(atom("P"), atom("Q")), atom("R")))

    def test_implies_right_associative(self):
        # P -> Q -> R  =  P -> (Q -> R)
        result = parse_formula("P -> Q -> R")
        self.assertEqual(result, implies(atom("P"), implies(atom("Q"), atom("R"))))

    def test_and_binds_tighter_than_or(self):
        # P & Q | R  =  (P & Q) | R
        result = parse_formula("P & Q | R")
        self.assertEqual(result, or_(and_(atom("P"), atom("Q")), atom("R")))

    def test_or_binds_tighter_than_implies(self):
        # P | Q -> R  =  (P | Q) -> R
        result = parse_formula("P | Q -> R")
        self.assertEqual(result, implies(or_(atom("P"), atom("Q")), atom("R")))

    def test_parentheses_override_precedence(self):
        # P & (Q | R)  should NOT become  (P & Q) | R
        result = parse_formula("P & (Q | R)")
        self.assertEqual(result, and_(atom("P"), or_(atom("Q"), atom("R"))))


class TestQuantifiers(unittest.TestCase):

    def test_forall(self):
        self.assertEqual(parse_formula("A.x P(x)"), forall("x", atom("P", var("x"))))

    def test_exists(self):
        self.assertEqual(parse_formula("E.x P(x)"), exists("x", atom("P", var("x"))))

    def test_nested_quantifiers(self):
        result = parse_formula("A.x E.y P(x,y)")
        expected = forall("x", exists("y", atom("P", var("x"), var("y"))))
        self.assertEqual(result, expected)

    def test_quantifier_scope_extends_right(self):
        # A.x P(x) -> Q  should parse as  (A.x P(x)) -> Q
        # because -> is looser than quantifier scope
        result = parse_formula("A.x P(x) -> Q")
        self.assertEqual(result, implies(forall("x", atom("P", var("x"))), atom("Q")))

    def test_quantifier_with_parens(self):
        result = parse_formula("A.x (P(x) -> Q(x))")
        expected = forall("x", implies(atom("P", var("x")), atom("Q", var("x"))))
        self.assertEqual(result, expected)

    def test_variable_bound_in_scope(self):
        # Inside A.x, 'x' must be a Variable not a Constant
        result = parse_formula("A.x P(x)")
        inner_atom = result.body
        self.assertIsInstance(inner_atom.args[0], Variable)
        self.assertEqual(inner_atom.args[0].name, "x")

    def test_variable_free_outside_scope(self):
        # P(alice) — multi-char lowercase name → always Constant
        result = parse_formula("P(alice)")
        self.assertIsInstance(result.args[0], Constant)

    def test_same_var_reused_in_different_quantifiers(self):
        # (A.x P(x)) & (E.x Q(x)) — each x is independently bound
        result = parse_formula("(A.x P(x)) & (E.x Q(x))")
        left_body  = result.left.body
        right_body = result.right.body
        self.assertIsInstance(left_body.args[0],  Variable)
        self.assertIsInstance(right_body.args[0], Variable)


class TestFunctions(unittest.TestCase):

    def test_unary_function(self):
        self.assertEqual(
            parse_formula("P(f(x))"),
            atom("P", func("f", var("x")))
        )

    def test_binary_function(self):
        self.assertEqual(
            parse_formula("P(f(x,y))"),
            atom("P", func("f", var("x"), var("y")))
        )

    def test_nested_functions(self):
        self.assertEqual(
            parse_formula("P(f(g(x)))"),
            atom("P", func("f", func("g", var("x"))))
        )

    def test_function_with_constant(self):
        # Use multi-char constant name to distinguish from variable
        self.assertEqual(
            parse_formula("P(f(alice))"),
            atom("P", func("f", const("alice")))
        )

    def test_function_mixed_args(self):
        # Use multi-char constant name to distinguish from variable
        self.assertEqual(
            parse_formula("P(f(x,alice))"),
            atom("P", func("f", var("x"), const("alice")))
        )

    def test_function_inside_quantifier(self):
        result = parse_formula("A.x P(f(x))")
        fn_arg = result.body.args[0]
        self.assertIsInstance(fn_arg, Function)
        self.assertIsInstance(fn_arg.args[0], Variable)


class TestComplexFormulae(unittest.TestCase):

    def test_modus_ponens_shape(self):
        # (P -> Q) & P -> Q
        result = parse_formula("(P -> Q) & P -> Q")
        self.assertIsInstance(result, BinaryOp)
        self.assertEqual(result.connective, Connective.IMPLIES)

    def test_excluded_middle(self):
        result = parse_formula("P | ~P")
        self.assertEqual(result, or_(atom("P"), neg(atom("P"))))

    def test_de_morgan(self):
        result = parse_formula("~(P & Q)")
        self.assertEqual(result, neg(and_(atom("P"), atom("Q"))))

    def test_all_implies_exists(self):
        result = parse_formula("A.x P(x) -> E.x P(x)")
        self.assertIsInstance(result, BinaryOp)
        self.assertEqual(result.connective, Connective.IMPLIES)
        self.assertIsInstance(result.left,  QuantifiedFormula)
        self.assertIsInstance(result.right, QuantifiedFormula)

    def test_transitivity(self):
        result = parse_formula("A.x A.y A.z (P(x,y) & P(y,z) -> P(x,z))")
        # Should be three nested foralls
        self.assertEqual(result.quantifier, Quantifier.FORALL)
        self.assertEqual(result.body.quantifier, Quantifier.FORALL)
        self.assertEqual(result.body.body.quantifier, Quantifier.FORALL)


class TestStringOutput(unittest.TestCase):
    """Round-trip: parse then str() and check the pretty-print is correct."""

    def check(self, src, expected):
        self.assertEqual(str(parse_formula(src)), expected)

    def test_atom_str(self):          self.check("P(x)",              "P(x)")
    def test_negation_str(self):      self.check("~P",                 "¬P")
    def test_and_str(self):           self.check("P & Q",              "(P ∧ Q)")
    def test_or_str(self):            self.check("P | Q",              "(P ∨ Q)")
    def test_implies_str(self):       self.check("P -> Q",             "(P → Q)")
    def test_forall_str(self):        self.check("A.x P(x)",           "∀x.P(x)")
    def test_exists_str(self):        self.check("E.x P(x)",           "∃x.P(x)")
    def test_top_str(self):           self.check("True",               "⊤")
    def test_bot_str(self):           self.check("False",              "⊥")
    def test_function_str(self):      self.check("P(f(x))",            "P(f(x))")


class TestParseErrors(unittest.TestCase):

    def test_empty_string_raises(self):
        with self.assertRaises((ParseError, ValueError)):
            parse_formula("")

    def test_unmatched_paren_raises(self):
        with self.assertRaises((ParseError, Exception)):
            parse_formula("(P & Q")

    def test_missing_operand_raises(self):
        with self.assertRaises((ParseError, Exception)):
            parse_formula("P &")

    def test_bare_arrow_raises(self):
        with self.assertRaises((ParseError, Exception)):
            parse_formula("->")


class TestParseFile(unittest.TestCase):

    def _write_tmp(self, content: str) -> str:
        """Write content to a temp file and return the path."""
        fd, path = tempfile.mkstemp(suffix=".fol")
        with os.fdopen(fd, "w") as f:
            f.write(content)
        return path

    def test_single_formula(self):
        path = self._write_tmp("P(x)\n")
        result = parse_file(path)
        self.assertEqual(len(result), 1)
        self.assertEqual(result[0], atom("P", var("x")))

    def test_multiple_formulae(self):
        path = self._write_tmp("P\nQ\nR\n")
        result = parse_file(path)
        self.assertEqual(len(result), 3)

    def test_blank_lines_ignored(self):
        path = self._write_tmp("P\n\n\nQ\n")
        result = parse_file(path)
        self.assertEqual(len(result), 2)

    def test_comments_ignored(self):
        path = self._write_tmp("# this is a comment\nP\n# another\nQ\n")
        result = parse_file(path)
        self.assertEqual(len(result), 2)

    def test_empty_file_returns_empty_list(self):
        path = self._write_tmp("")
        result = parse_file(path)
        self.assertEqual(result, [])

    def test_comment_only_file(self):
        path = self._write_tmp("# just comments\n# nothing else\n")
        result = parse_file(path)
        self.assertEqual(result, [])

    def test_inline_comment_not_supported(self):
        # Inline comments (P  # comment) are not part of our grammar —
        # the whole line should raise, not silently ignore the comment
        path = self._write_tmp("P  # inline\n")
        with self.assertRaises(Exception):
            parse_file(path)


# ─────────────────────────────────────────────
#  ENTRY POINT
# ─────────────────────────────────────────────

if __name__ == "__main__":
    unittest.main(verbosity=2)