fof(premise_0, axiom, (![X] : (grandSlamChampion(X) <~> oscarNominatedActor(X)))).
fof(premise_1, axiom, (![X] : (grandSlamChampion(X) => professionalTennisPlayer(X)))).
fof(premise_2, axiom, (![X] : (oscarNominatedActor(X) => celebrity(X)))).
fof(premise_3, axiom, (![X] : (professionalTennisPlayer(X) => athlete(X)))).
fof(premise_4, axiom, (![X] : (celebrity(X) => wellPaid(X)))).
fof(premise_5, axiom, (![X] : (athlete(X) => famous(X)))).
fof(premise_6, axiom, (![X] : (wellPaid(X) => livesInTaxHaven(X)))).
fof(premise_7, axiom, (famous(djokovic) & athlete(djokovic) => livesInTaxHaven(djokovic))).
fof(conclusion, conjecture, (livesInTaxHaven(djokovic))).