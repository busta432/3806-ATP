fof(premise_0, axiom, (![X] : (cat(X) => mammal(X)))).
fof(premise_1, axiom, (?[X] : (pet(X) & ~mammal(X)))).
fof(conclusion, conjecture, (![X] : (pet(X) => ~cat(X)))).