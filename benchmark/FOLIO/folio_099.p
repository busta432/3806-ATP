fof(premise_0, axiom, (![X] : (animalsLovedByTourists(X) => maxFavoriteAnimals(X)))).
fof(premise_1, axiom, (![X] : (animalsFromAustralia(X) => animalsLovedByTourists(X)))).
fof(premise_2, axiom, (![X] : (quokka(X) => animalsFromAustralia(X)))).
fof(premise_3, axiom, (![X] : (maxFavoriteAnimals(X) => veryFluffy(X)))).
fof(premise_4, axiom, (![X] : (maxFavoriteAnimals(X) => loveToSleep(X)))).
fof(premise_5, axiom, (veryFluffy(koala) => ~quokka(koala))).
fof(conclusion, conjecture, (quokka(koala) => loveToSleep(koala) <~> veryFluffy(koala))).