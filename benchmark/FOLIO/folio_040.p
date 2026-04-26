fof(premise_0, axiom, (![X] : (zahaHadidDesignStyle(X) => timeless(X)))).
fof(premise_1, axiom, (![X] : (massProductDesign(X) => ~timeless(X)))).
fof(premise_2, axiom, (![X] : (zahaHadidDesignStyle(X) | kellyWearstlerDesignStyle(X)))).
fof(premise_3, axiom, (![X] : (kellyWearstlerDesignStyle(X) => evocative(X)))).
fof(premise_4, axiom, (![X] : (kellyWearstlerDesignStyle(X) => dreamy(X)))).
fof(premise_5, axiom, (timeless(aDesignByMax) => massProductDesign(aDesignByMax) & evocative(aDesignByMax))).
fof(conclusion, conjecture, (massProductDesign(aDesignByMax))).