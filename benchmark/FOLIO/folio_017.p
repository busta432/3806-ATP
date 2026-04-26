fof(premise_0, axiom, (![X] : (rabbit(X) => cute(X)))).
fof(premise_1, axiom, (?[X] : (turtle(X)))).
fof(premise_2, axiom, (![X] : (rabbit(X) | squirrel(X)))).
fof(premise_3, axiom, (![X] : (skittish(X) => ~still(X)))).
fof(premise_4, axiom, (![X] : (squirrel(X) => skittish(X)))).
fof(premise_5, axiom, (still(rock))).
fof(conclusion, conjecture, (turtle(rock))).