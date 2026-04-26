fof(premise_0, axiom, (![X] : (vehicleregistrationplate(X, istanbul) => beginwith(X, number34)))).
fof(premise_1, axiom, (![X] : (~beginwith(X, number34) => ~fromIstanbul(X)))).
fof(premise_2, axiom, (vehicleregistrationplate(joe, istanbul))).
fof(premise_3, axiom, (beginwith(tom, number35))).
fof(premise_4, axiom, (![X] : (beginwith(X, number35) => ~beginwith(X, number34)))).
fof(conclusion, conjecture, (vehicleregistrationplate(tom, istanbul))).