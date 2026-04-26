fof(premise_0, axiom, (season(spring) | season(summer) | season(fall) | season(winter))).
fof(premise_1, axiom, (![X] : (wantlongVacation(X) => love(X, summer)))).
fof(premise_2, axiom, (love(emma, summer))).
fof(premise_3, axiom, (~love(mia, emma))).
fof(premise_4, axiom, (wantlongVacation(james))).
fof(conclusion, conjecture, (love(mia, spring))).