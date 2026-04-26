fof(premise_0, axiom, (?[X] : (mondayat8(X) & roseGivenOutOnTv(X)))).
fof(premise_1, axiom, (![X] : (roseGivenOutOnTv(X) => onBachelor(X)))).
fof(premise_2, axiom, (![X] : (onBachelor(X) => portrayLiveOfRealPeople(X)))).
fof(premise_3, axiom, (![X] : (portrayLiveOfRealPeople(X) => realityTVShow(X)))).
fof(premise_4, axiom, (~realityTVShow(breakingbad))).
fof(conclusion, conjecture, (roseGivenOutOnTv(breakingbad) => mondayat8(breakingbad))).