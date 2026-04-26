fof(premise_0, axiom, (![X] : (cow(X) => bovine(X)))).
fof(premise_1, axiom, (?[X] : (pet(X) & cow(X)))).
fof(premise_2, axiom, (![X] : (bovine(X) => domesticated(X)))).
fof(premise_3, axiom, (![X] : (domesticated(X) => ~aligator(X)))).
fof(premise_4, axiom, (aligator(ted))).
fof(conclusion, conjecture, (pet(ted) & cow(ted))).