fof(premise_0, axiom, (![X] : (spill(X) => ~tidy(X)))).
fof(premise_1, axiom, (![X] : (foodie(X) => spill(X)))).
fof(premise_2, axiom, (![X] : (onlyChild(X) => tidy(X)))).
fof(premise_3, axiom, (![X] : (busyParents(X) => onlyChild(X)))).
fof(premise_4, axiom, (![X] : (highIncome(X) => busyParents(X)))).
fof(premise_5, axiom, ((spill(peter) & onlyChild(peter)) | ~spill(peter) & ~onlyChild(peter)))).
fof(conclusion, conjecture, (foodie(peter) | highIncome(peter))).