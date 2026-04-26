fof(premise_0, axiom, (![X] : (internationalStudent(X) => f1(X) <~> j1(X)))).
fof(premise_1, axiom, (![X] : (internationalStudent(X) & f1(X) & wantWorkInUS(X) => apply(X, cpt) | apply(X, opt)))).
fof(premise_2, axiom, (internationalStudent(mike))).
fof(premise_3, axiom, (wantWorkInUS(mike) => apply(mike, cpt))).
fof(conclusion, conjecture, (f1(mike))).