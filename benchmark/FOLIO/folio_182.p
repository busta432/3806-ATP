fof(premise_0, axiom, (flyTo(susan, lga))).
fof(premise_1, axiom, (![X] : ![Y] : (flyFrom(X, Y) <~> flyTo(X, Y)))).
fof(premise_2, axiom, (flyFrom(john, lga))).
fof(conclusion, conjecture, (flyTo(john, lga))).