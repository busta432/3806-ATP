fof(premise_0, axiom, (![X] : (horse(X) => hooves(X)))).
fof(premise_1, axiom, (![X] : (human(X) => ~hooves(X)))).
fof(conclusion, conjecture, (?[X] : (human(X) & horse(X)))).