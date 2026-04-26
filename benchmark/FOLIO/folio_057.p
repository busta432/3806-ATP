fof(premise_0, axiom, (isStriker(robertLewandowski))).
fof(premise_1, axiom, (![X] : (isStriker(X) => isSoccerPlayer(X)))).
fof(premise_2, axiom, (leftTeam(robertLewandowski, bayernMunchen))).
fof(premise_3, axiom, (![X] : ![Y] : (leftTeam(X, Y) => ~playsForTeam(X, Y)))).
fof(conclusion, conjecture, (playsForTeam(robertLewandowski, bayernMunchen))).