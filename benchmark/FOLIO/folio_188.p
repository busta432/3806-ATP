fof(premise_0, axiom, (![X] : (isPodcast(X) => ~isNovel(X)))).
fof(premise_1, axiom, (![X] : ?[Y] : (bornIn(X, Y) & isCity(Y) & isAmerican(Y) => isAmerican(X)))).
fof(premise_2, axiom, (![X] : ![Y] : (isNovel(X) & writtenBy(X, Y) => writesNovel(Y)))).
fof(premise_3, axiom, (isAmerican(dani_Shapiro) & isWriter(dani_Shapiro))).
fof(premise_4, axiom, (writtenBy(family_History, dani_Shapiro))).
fof(premise_5, axiom, (isNovel(family_History) & writtenIn(family_History, y2003))).
fof(premise_6, axiom, (isPodcast(family_Secrets) & createdBy(family_Secrets, dani_Shapiro))).
fof(premise_7, axiom, (isCity(boston) & isAmerican(boston))).
fof(conclusion, conjecture, (bornIn(dani_Shapiro, boston))).