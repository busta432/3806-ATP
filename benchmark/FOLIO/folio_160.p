fof(premise_0, axiom, (![X] : (workLibrary(X) => ~computerScience(X)))).
fof(premise_1, axiom, (![X] : (partTime(X) => workLibrary(X)))).
fof(premise_2, axiom, (![X] : (database(X) => computerScience(X)))).
fof(premise_3, axiom, (![X] : (professorDavid(X) => database(X)))).
fof(premise_4, axiom, (![X] : (workInLab(X) => professorDavid(X)))).
fof(premise_5, axiom, (workInLab(james))).
fof(premise_6, axiom, (~partTime(jack) & ~workInLab(jack))).
fof(conclusion, conjecture, (database(james) <~> partTime(james))).