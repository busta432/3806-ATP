Designing a Theorem Prover - Lawrence Paulson; University of Cambridge



**Chapter 1: Introduction to Folderol : A simple Theorem Prover**



The contraction rules, in backwards proof, duplicate a formula. Duplicating the A ∧ B, then applying the conjunction rule above, makes subgoals |− A, A ∧ B and

|− B,A ∧ B. These are equivalent to |− A and |− B, so the A ∧ B is redundant.



A case-by-case inspection of the rules reveals that **the only formulae worth duplicating are ∀x.A on the left and ∃x.A on the right.**

Let us add contraction to the rules ∀:left and ∃:right. The rule ∀:left takes a goal containing ∀x.A on the left

and makes one subgoal by adding the formula A\[t/x] for some term t. The subgoal retains a copy of ∀x.A so that the rule can be applied again for some other term.

This example requires n repeated uses of the quantified formula on terms a, f(a):

∀x.P(x) → P(f(x)) |− P(a) → P(f(f(··· f | {z }

n times (a)···)))



The rule ∃:right similarly retains the quantified formula in its subgoal.

Folderol uses these quantified formulae in rotation. It never throws them away. Thus even

∀x.P(x) |− Q

makes Folderol run forever. **If not for the re-use of quantified formulae, the search space would be finite. A theorem prover should only instantiate a quantifier when**

**strictly necessary — but there is no effective test. First-order logic is undecidable.**





1.2 PL:

PL is concerned with connectives /\\, \\/, -> <-> and \~.



* We take negation as primitive rather than defining ¬A as A → ⊥.
* Although A ↔ B means (A → B) ∧ (B → A), performing this expansion could cause exponential blowup! The

&#x20;  rules for ↔ permit natural reasoning.



Rules can be chosen to minimise the proliferation of subgoals. If a goal is a basic sequent then trying other rules seems pointless.

* Once we introduce unification, we have to be careful. Solving a goal by unification may instantiate variables in other goals, possibly rendering them unprovable.



Let us say that the cost of a rule is the number of premises it has. A rule with one premise is cheaper than a rule with two premises;

∧:left is cheaper than ∧:right.

The obvious representation of the goal Γ |− ∆, a pair of lists, is awkward for choosing the cheapest rule. A Folderol goal is a list of triples ordered by cost.

* Each triple contains a formula, a ‘side’ (either Left or Right), and a cost.



**1.3 Quantifiers and Unification:**

FOL extends PL with the quantifiers forall \& exists, as well as variables and other terms.



In backwards proof, forall(left) and exists(right) produce an unspecified term (t), which could be any combination of variables, constants, and functions.

* The possiblities are literally infinite.



How to handle this problem - Meta-variables:

* At some point in time later in the proof it may be obvious what the replacement for these (t) will be. So a common solution is to use a meta-variable to stand for an unspecified term (?a, ?b, ?c - denoted by a ?).

  * A backwards ∀:left or ∃:right inserts a fresh meta-variable ?b in place of t inthe subgoal.
  * Whenever a new subgoal is produced, Folderol tries to change it to a basic sequent. It looks for a left-formula A1 and right-formula A2 such that replacing meta-variables by properly chosen terms turns both into the same formula A. We say A is a common instance of A1 and A2.
* The process of making such choices is called **unification.**



**For example,** R(?a, f(x)) and R(g(?b), ?b)

both become R(g(f(x)), f(x)) replacing ?a by g(f(x)) and ?b by f(x).

This assignment is written ?a |→ g(f(x)), ?b |→ f(x).





**1.4 Parameters in Quantifier Rules**

Substitution should never cause a free variable to become bound. This error is called **variable capture** and permits unsound inferences.



* Variable capture can be prevented by renaming bound variables during substitution, but the algos to do this are complicated and liable to obsecure errors (Note this is 1990's paper).



* Simpler Approach - Instead have disjoint set of paramters a,b,c... and variables x,y,z,.... where parameters may not be bound and variables must be bound.

  * Many Logicians maintain this distinction between bound variables and parameters (Prawitz, 1956).
* *Observe that a subformula may, under this distinction, not be a legal formula by itself.* For instance, ∀x.∃y.y != x has the subformula ∃y.y != x, where x appears unbound. We must replace the bound variable x by a paramter, say a. Applying forall(right) to |- ∀x.∃y.y != x produces the conclusion |- ∃y. y != a





1.4.1 Enforcement of provisos of quantifer rules:



The proviso of ∀:right and ∃:left — that a must not appear in the conclusion — ensures that a can denote an arbitrary value.

It may seem that if we choose a fresh parameter every time we use these rules, there is no danger of its appearing in the conclusion.

* However, instantiation of meta-variables can change the conclusion, adding new parameters.

Logically, b\[?a1,..., ?an] is like a Henkin constant (Barwise \[1977], page 30). Variable ?a is unifiable with term t just if ?a does not occur in t. This occurs

check can be extended to prevent invalid assignments to meta-variables.





1.4.2 No second-order dependence:

Each new parameter depends on all the meta-variables in the goal. But if the goal contains some other parameter b\[?a] this does not mean it contains ?a.



(Not sure I really Understand this part here)





**1.4.3 Summary:**

Procedure for enforcing the provisos of the rules forall right and exists left:



* When applying either rule, choose a fresh parameter - one that appears nowhere else in the proof - and make it depend on all meta-variables present in the conclusion.
* Allow the assignment ?a |-> t, only iff t does not depend on ?a.

  * Ensures that each parameter b in t does not depend on ?a, so the assignment respects the proviso of the rule that created b.
* To perform the assignment ?a |-> t, replace ?a by *t* throughout the proof. Replace each parameter depending on ?a by one depending on the meta-variable in t.



There is no logical need to distinguish meta-variables from parameters, but the distinction helps us remember which variables are candidates for substitution.

* A lemma about LK justifies the substitution of terms for meta-variables under suitable conditions \[Takeuti 1987, Lemma 2.11]





**Chapter 2: Basic Data Structures \& Operations:**



In this chapter we will explore type definitions and substitution functions.



**2.1 Terms:**

