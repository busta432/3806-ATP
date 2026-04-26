fof(premise_0, axiom, (cove(barutin) & nameAfter(barutin, settlement) & locate(settlement, bulgaria))).
fof(premise_1, axiom, (locate(barutin, snow))).
fof(premise_2, axiom, (locate(snow, shetland) & locate(greenwich, shetland) & locate(deception, shetland))).
fof(premise_3, axiom, (locate(shetland, antarctica))).
fof(premise_4, axiom, (![X] : ![Y] : ![Z] : ((locate(X, Y) & locate(Y, Z)) => locate(X, Z)))).
fof(conclusion, conjecture, (~locate(barutin, antarctica))).