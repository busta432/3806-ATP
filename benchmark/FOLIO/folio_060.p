fof(premise_0, axiom, (cityIn(billings, montana))).
fof(premise_1, axiom, (cityIn(butte, montana) & cityIn(helena, montana) & cityIn(missoula, montana))).
fof(premise_2, axiom, (?[X] : (cityIn(whitesulphursprings, X) & cityIn(butte, X)))).
fof(premise_3, axiom, (~cityIn(pierre, montana))).
fof(premise_4, axiom, (![X] : (cityIn(butte, X) => ~cityIn(pierre, X)))).
fof(conclusion, conjecture, (?[X] : (cityIn(pierre, X) & cityIn(bismarck, X)))).