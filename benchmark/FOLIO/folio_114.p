fof(premise_0, axiom, (mountainRange(picurismountains) & in(picurismountains, newmexico) | in(picurismountains, texas))).
fof(premise_1, axiom, (visited(juandeonate, picurismountains))).
fof(premise_2, axiom, (in(hardingpegmatitemine, picurismountains) & mine(hardingpegmatitemine) & donated(hardingpegmatitemine))).
fof(premise_3, axiom, (![X] : ![Y] : (mine(X) & donated(X) & in(X, Y) & mountainRange(Y) => ~in(Y, texas)))).
fof(conclusion, conjecture, (?[X] : (visited(juandeonate, X) & mountainRange(X) & in(X, texas)))).