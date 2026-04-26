fof(premise_0, axiom, (![X] : (kind(X) <~> evil(X)))).
fof(premise_1, axiom, (![X] : (ugly(X) => ~handsome(X)))).
fof(premise_2, axiom, (![X] : (evil(X) => ugly(X)))).
fof(premise_3, axiom, (![X] : (gentleman(X) => handsome(X)))).
fof(premise_4, axiom, (![X] : (cEO(X) => gentleman(X)))).
fof(premise_5, axiom, (gentleman(harry))).
fof(conclusion, conjecture, (kind(harry) | cEO(harry))).