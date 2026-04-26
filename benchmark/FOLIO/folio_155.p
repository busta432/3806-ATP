fof(premise_0, axiom, (![X] : (desktop(X) => workHome(X)))).
fof(premise_1, axiom, (![X] : (homeOffice(X) => desktop(X)))).
fof(premise_2, axiom, (![X] : (workHome(X) => tidying(X)))).
fof(premise_3, axiom, (![X] : (workHome(X) => officeStore(X)))).
fof(premise_4, axiom, (![X] : (tidying(X) => ~late(X)))).
fof(premise_5, axiom, ((late(remy) & tidying(remy)) <~> (~late(remy) & ~tidying(remy)))).
fof(conclusion, conjecture, (homeOffice(remy) & officeStore(remy))).