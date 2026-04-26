fof(premise_0, axiom, (?[X] : (occurMonkeypoxVirus(X) & getMonkeypox(X)))).
fof(premise_1, axiom, (?[X] : (animal(X) & occurMonkeypoxVirus(X)))).
fof(premise_2, axiom, (![X] : (human(X) => mammal(X)))).
fof(premise_3, axiom, (![X] : (mammal(X) => animal(X)))).
fof(premise_4, axiom, (?[X] : (getMonkeypox(X) & (fever(X) | headache(X) | musclePain(X) | tired(X))))).
fof(premise_5, axiom, (![X] : (human(X) & flu(X) => tired(X)))).
fof(conclusion, conjecture, (?[X] : (animal(X)))).