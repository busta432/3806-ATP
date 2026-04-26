fof(premise_0, axiom, (![X] : (nLP(X) => nLG(X) <~> nLU(X)))).
fof(premise_1, axiom, (![X] : (nLP(X) & outputSequence(X) => nLG(X)))).
fof(premise_2, axiom, (nLP(machineTranslation))).
fof(premise_3, axiom, (outputSequence(machineTranslation))).
fof(conclusion, conjecture, (nLG(machineTranslation))).