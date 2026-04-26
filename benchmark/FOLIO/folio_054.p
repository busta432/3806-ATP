fof(premise_0, axiom, (![X] : (romanceLanguage(X) => indoEuropeanLanguage(X)))).
fof(premise_1, axiom, (![X] : (romanceLanguage(X) => memberOf(X, romancefamily)))).
fof(premise_2, axiom, (![X] : ![Y] : ![Z] : ((memberOf(X, Z) & memberOf(Y, Z)) => (related(X, Y) & related(Y, X))))).
fof(premise_3, axiom, (romanceLanguage(french) & romanceLanguage(spanish))).
fof(premise_4, axiom, (related(german, spanish))).
fof(premise_5, axiom, (![X] : (~related(basque, X)))).
fof(conclusion, conjecture, (romanceLanguage(german))).