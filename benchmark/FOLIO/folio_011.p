fof(premise_0, axiom, (![X] : (wildTurkey(X) => (eastern(X) | osceola(X) | goulds(X) | merriams(X) | riogrande(X) | ocellated(X))))).
fof(premise_1, axiom, (~(wildTurkey(tom) & eastern(tom)))).
fof(premise_2, axiom, (~(wildTurkey(tom) & osceola(tom)))).
fof(premise_3, axiom, (wildTurkey(tom) => ~(goulds(tom) | merriams(tom) | riogrande(tom)))).
fof(premise_4, axiom, (wildTurkey(tom))).
fof(conclusion, conjecture, (eastern(tom))).