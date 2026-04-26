fof(premise_0, axiom, (cost205(gre))).
fof(premise_1, axiom, (![X] : (cost205(X) => costBelow300(X)))).
fof(premise_2, axiom, (![X] : (hardship(X) => financialAid(X)))).
fof(premise_3, axiom, (![X] : (singleParent(X) | fewResources(X) => hardship(X)))).
fof(premise_4, axiom, (singleParent(tom))).
fof(premise_5, axiom, (fewResources(tom))).
fof(conclusion, conjecture, (~(?[X] : (financialAid(X))))).