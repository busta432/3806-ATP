fof(premise_0, axiom, (![X] : (bark(X) => ~like(jane, X)))).
fof(premise_1, axiom, (![X] : (dog(X) => bark(X)))).
fof(premise_2, axiom, (![X] : (jump(X) => like(jane, X)))).
fof(premise_3, axiom, (![X] : (haveLegs(X) => jump(X)))).
fof(premise_4, axiom, (![X] : (terricolous(X) => haveLegs(X)))).
fof(premise_5, axiom, ((~jump(kiki) & ~haveLegs(kiki)) => (terricolous(kiki) | haveLegs(kiki)))).
fof(conclusion, conjecture, (terricolous(kiki))).