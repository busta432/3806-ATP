fof(premise_0, axiom, (from(heinrichScmidt, naziGermany) & politician(heinrichScmidt))).
fof(premise_1, axiom, (member(heinrichScmidt, prussianStateParliament) & member(heinrichScmidt, naziReichstag))).
fof(conclusion, conjecture, (![X] : (politician(X) => ~member(X, naziReichstag)))).