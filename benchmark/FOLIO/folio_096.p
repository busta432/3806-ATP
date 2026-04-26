fof(premise_0, axiom, (?[X] : (managedBuilding(X) & allowPet(X)))).
fof(premise_1, axiom, (![X] : (managedBuilding(X) => requireDeposit(X)))).
fof(premise_2, axiom, (![X] : (rent2000(X) <=> ~depositNoMoreThan1500(X)))).
fof(premise_3, axiom, (![X] : (rent2000(X) <=> depositNoLessThan2000(X)))).
fof(premise_4, axiom, (cat(fluffy))).
fof(premise_5, axiom, (![X] : (cat(X) => pet(X)))).
fof(premise_6, axiom, (managedBuilding(oliveGarden))).
fof(premise_7, axiom, (rent2000(oliveGarden))).
fof(premise_8, axiom, (![X] : (tomRent(X) <=> (managedBuilding(X) & allowPet(X) & depositNoMoreThan1500(X))))).
fof(conclusion, conjecture, (depositNoLessThan2000(oliveGarden))).