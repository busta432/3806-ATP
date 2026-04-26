fof(premise_0, axiom, (![X] : (salad(X) => healthyHabits(X)))).
fof(premise_1, axiom, (![X] : (healthyChildhood(X) => salad(X)))).
fof(premise_2, axiom, (![X] : (nutritional(X) => healthyChildhood(X)))).
fof(premise_3, axiom, (![X] : (goodRelationship(X) => ~healthyHabits(X)))).
fof(premise_4, axiom, (![X] : (gym(X) => nutritional(X)))).
fof(premise_5, axiom, ((healthyChildhood(taylor) & goodRelationship(taylor)) | ~healthyChildhood(taylor) & ~goodRelationship(marcy))).
fof(conclusion, conjecture, (salad(taylor))).