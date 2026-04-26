fof(premise_0, axiom, (bornIn(ailtonsilva, y1995) & commonlyKnownAs(ailtonsilva, ailton))).
fof(premise_1, axiom, (footballPlayer(ailton) & loanedTo(ailton, braga))).
fof(premise_2, axiom, (brazilian(ailtonsilva) & footballplayer(ailtonsilva) & playsFor(ailtonsilva, nautico))).
fof(premise_3, axiom, (footballClub(nautico) & footballClub(braga))).
fof(premise_4, axiom, (footballClub(fluminense))).
fof(conclusion, conjecture, (?[X] : (footballClub(X) & loanedTo(ailtonsilva, X)))).