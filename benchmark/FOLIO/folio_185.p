fof(premise_0, axiom, (![X] : (nice(X) => ~mean(X)))).
fof(premise_1, axiom, (?[X] : (grumpy(X) & mean(X)))).
fof(premise_2, axiom, (![X] : (animalLover(X) => nice(X)))).
fof(premise_3, axiom, (![X] : (petOwner(X) => animalLover(X)))).
fof(premise_4, axiom, (petOwner(tom))).
fof(conclusion, conjecture, (~(grumpy(tom) & mean(tom)) => ~(grumpy(tom) | animalLover(tom)))).