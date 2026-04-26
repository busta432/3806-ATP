fof(premise_0, axiom, (winner(maurier, steinhauer))).
fof(premise_1, axiom, (participate(maurier, steinhauer))).
fof(premise_2, axiom, (?[X] : (leaderBoard(maurier, X) & sixWayTie(X) & belgium(X)))).
fof(premise_3, axiom, (belgium(descampe) & leaderBoard(maurier, descampe))).
fof(premise_4, axiom, (![X] : (leaderBoard(maurier, X) => participate(maurier, X)))).
fof(conclusion, conjecture, (~winner(maurier, steinhauer))).