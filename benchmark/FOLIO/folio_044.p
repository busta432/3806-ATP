fof(premise_0, axiom, (![X] : (rankedHighlyByWomenTennisAssociation(X) => amongMostActivePlayersInMajorTennis(X)))).
fof(premise_1, axiom, (![X] : (LostToIgaŚwiątek(X) => rankedHighlyByWomenTennisAssociation(X)))).
fof(premise_2, axiom, (![X] : (femaleTennisPlayersAtRolandGarros2022(X) => LostToIgaŚwiątek(X)))).
fof(premise_3, axiom, (![X] : (femaleTennisPlayersAtRolandGarros2022(X) | maleTennisPlayersAtRolandGarros2022(X)))).
fof(premise_4, axiom, (![X] : (maleTennisPlayersAtRolandGarros2022(X) => lostToRafaelNadal(X)))).
fof(premise_5, axiom, (rankedHighlyByWomenTennisAssociation(cocoGauff) | lostToRafaelNadal(cocoGauff) => ~maleTennisPlayersAtRolandGarros2022(cocoGauff))).
fof(conclusion, conjecture, (lostToRafaelNadal(cocoGauff))).