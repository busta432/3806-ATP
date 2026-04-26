fof(premise_0, axiom, (![X] : (alien(X) => extraterrestrial(X)))).
fof(premise_1, axiom, (![X] : (fromMars(X) => alien(X)))).
fof(premise_2, axiom, (![X] : (extraterrestrial(X) => ~human(X)))).
fof(premise_3, axiom, (![X] : (fromEarth(X) => human(X)))).
fof(premise_4, axiom, (~fromEarth(marvin) & ~fromMars(marvin))).
fof(premise_5, axiom, (~fromEarth(marvin) => extraterrestrial(marvin))).
fof(conclusion, conjecture, (~human(marvin) & ~fromMars(marvin))).