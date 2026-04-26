fof(premise_0, axiom, (sportingEvent(olympics))).
fof(premise_1, axiom, (lastOlympics(tokyo))).
fof(premise_2, axiom, (mostMedals(unitedStates, tokyo))).
fof(conclusion, conjecture, (?[X] : (lastOlympics(X) & mostMedals(unitedStates, X)))).