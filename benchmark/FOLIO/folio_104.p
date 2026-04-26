fof(premise_0, axiom, (![X] : (twinTriplet(X) => playing(X)))).
fof(premise_1, axiom, (![X] : (sameAge(X) => twinTriplet(X)))).
fof(premise_2, axiom, (![X] : (complain(X) => sameAge(X)))).
fof(premise_3, axiom, (![X] : (notHome(X) => ~strongBonds(X)))).
fof(premise_4, axiom, (![X] : (playing(X) => notHome(X)))).
fof(premise_5, axiom, ((twinTriplet(luke) & strongBonds(luke)) <~> (~twinTriplet(luke) & ~strongBonds(luke)))).
fof(conclusion, conjecture, (complain(luke))).