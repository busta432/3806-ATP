fof(premise_0, axiom, (![X] : (student(X) => human(X)))).
fof(premise_1, axiom, (![X] : (study(X) => student(X)))).
fof(premise_2, axiom, (![X] : (study(X) | teach(X)))).
fof(premise_3, axiom, (![X] : (young(X) => ~teach(X)))).
fof(premise_4, axiom, (~teach(jerry) & ~manager(jerry))).
fof(premise_5, axiom, (young(rose) | student(rose))).
fof(conclusion, conjecture, (~young(jerry))).