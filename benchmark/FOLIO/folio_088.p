fof(premise_0, axiom, (![X] : ![Y] : (superheroMovie(X) & goodGuy(Y) & appearsIn(Y, X) => wins(Y)))).
fof(premise_1, axiom, (superheroMovie(surprisingAdventuresofSirDigbyChickenCaesar))).
fof(premise_2, axiom, (![X] : ![Y] : (goodGuy(X) & fights(X, Y) ⟷ badGuy(Y) & fights(Y, X)))).
fof(premise_3, axiom, (fights(sirDigby, sirDigbyNemesis))).
fof(premise_4, axiom, (![X] : ![Y] : (superheroMovie(X), namedAfter(X, Y) => goodGuy(Y)))).
fof(premise_5, axiom, (namedAfter(surprisingAdventuresofSirDigbyChickenCaesar, sirDigby))).
fof(premise_6, axiom, (![X] : ![Y] : (fights(X, Y) & wins(X) => ~wins(Y)))).
fof(conclusion, conjecture, (![X] : ![Y] : (superheroMovie(X) & appearsIn(Y, X) => goodGuy(Y)))).