fof(premise_0, axiom, (![X] : ![Y] : (breedingBack(X, Y) => artificiallySelect(X)))).
fof(premise_1, axiom, (?[X] : ?[Y] : (heckCattle(X) & aurochs(Y) & breedingBack(X, Y)))).
fof(premise_2, axiom, (![X] : (heckCattle(X) => animal(X)))).
fof(premise_3, axiom, (![X] : (aurochs(X) => animal(X)))).
fof(premise_4, axiom, (?[X] : ?[Y] : (animal(X) & animal(Y) & breedingBack(X, Y) & extinct(Y)))).
fof(conclusion, conjecture, (?[X] : (heckCattle(X) & artificiallySelect(X)))).