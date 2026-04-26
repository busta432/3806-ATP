fof(premise_0, axiom, (![X] : (square(X) => fourSides(X)))).
fof(premise_1, axiom, (![X] : (fourSides(X) => isShape(X)))).
fof(conclusion, conjecture, (![X] : (square(X) => isShape(X)))).