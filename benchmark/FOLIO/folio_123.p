fof(premise_0, axiom, (![X] : (transportMultiplePassengers(X) => ~empty(X)))).
fof(premise_1, axiom, (![X] : (airline(X) => transportMultiplePassengers(X)))).
fof(premise_2, axiom, (![X] : (plane(X) => empty(X)))).
fof(premise_3, axiom, (![X] : (boeing707(X) => plane(X)))).
fof(premise_4, axiom, (~airline(greyhound) => ~(airline(greyhound) | plane(greyhound)))).
fof(conclusion, conjecture, (airline(greyhound))).