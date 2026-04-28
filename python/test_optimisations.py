import unittest
from fol_types import Variable, Constant, Atom, QuantifiedFormula, Quantifier, BinaryOp, Connective, Sequent
from improved import ImprovedProver
from formula_utils import formula_complexity
from indexing import FingerprintIndex

class TestOptimisations(unittest.TestCase):
    def test_formula_complexity(self):
        x = Variable("x")
        a = Constant("a")
        Px = Atom("P", (x,))
        Pa = Atom("P", (a,))
        f1 = Px
        f2 = QuantifiedFormula(Quantifier.FORALL, x, Px)
        f3 = BinaryOp(Connective.AND, Px, Pa)
        
        self.assertLess(formula_complexity(f1), formula_complexity(f2))
        self.assertLess(formula_complexity(f1), formula_complexity(f3))

    def test_fingerprint_indexing(self):
        index = FingerprintIndex()
        a = Constant("a")
        P_a = Atom("P", (a,))
        Q_a = Atom("Q", (a,))
        index.insert(P_a)
        
        candidates = index.query(P_a)
        self.assertIn(P_a, candidates)
        
        candidates_q = index.query(Q_a)
        self.assertNotIn(P_a, candidates_q)

    def test_prover_basic(self):
        prover = ImprovedProver()
        # P(a) -> P(a)
        a = Constant("a")
        Pa = Atom("P", (a,))
        f = BinaryOp(Connective.IMPLIES, Pa, Pa)
        success, stats = prover.prove(f)
        self.assertTrue(success)

    def test_regularity_condition(self):
        # (P(a) v P(a)) -> P(a)
        prover = ImprovedProver()
        a = Constant("a")
        Pa = Atom("P", (a,))
        f = BinaryOp(Connective.IMPLIES, BinaryOp(Connective.OR, Pa, Pa), Pa)
        success, stats = prover.prove(f)
        self.assertTrue(success)

    def test_metavariable_unification(self):
        prover = ImprovedProver()
        # forall x. P(x) |- P(a)
        x = Variable("x")
        a = Constant("a")
        Px = Atom("P", (x,))
        Pa = Atom("P", (a,))
        f = BinaryOp(Connective.IMPLIES, QuantifiedFormula(Quantifier.FORALL, x, Px), Pa)
        success, stats = prover.prove(f)
        self.assertTrue(success)

if __name__ == "__main__":
    unittest.main()
