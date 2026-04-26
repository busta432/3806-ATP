fof(premise_0, axiom, (![X] : (plunger(X) => suck(X)))).
fof(premise_1, axiom, (![X] : (vacuum(X) => suck(X)))).
fof(premise_2, axiom, (![X] : (vampire(X) => suck(X)))).
fof(premise_3, axiom, (vacuum(space))).
fof(premise_4, axiom, (houseHoldApp(duster) & ~ suck(duster))).
fof(conclusion, conjecture, (![X] : (houseHoldApp(X) => suck(X)))).