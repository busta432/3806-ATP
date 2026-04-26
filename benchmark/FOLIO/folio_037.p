fof(premise_0, axiom, (musicPiece(symphony9))).
fof(premise_1, axiom, (![X] : ![Y] : ((musicPiece(X) & writtenby(X, Y)) => composer(Y)))).
fof(premise_2, axiom, (writtenby(symphony9, beethoven))).
fof(premise_3, axiom, (premiered(viennamusicsociety, symphony9))).
fof(premise_4, axiom, (orchestra(viennamusicsociety))).
fof(premise_5, axiom, (lead(beethoven, viennamusicsociety))).
fof(premise_6, axiom, (![X] : ![Y] : ((orchestra(X) & lead(Y, X)) => conductor(Y)))).
fof(conclusion, conjecture, (composer(beethoven))).