fof(premise_0, axiom, (?[X] : (japanese(X) & videoGameCompany(X) & game(thelegendofzelda) & created(X, thelegendofzelda)))).
fof(premise_1, axiom, (![X] : ![Y] : (game(X) & inTop10(X) & created(X, Y) => japanese(Y)))).
fof(premise_2, axiom, (![X] : (game(X) & sellsMoreThan(X, onemillioncopies) => top10(X)))).
fof(premise_3, axiom, (sellsMoreThan(thelegendofzelda, onemillioncopies))).
fof(conclusion, conjecture, (![X] : (created(fifa22, X) => japanese(X) & videoGameCompany(X)))).