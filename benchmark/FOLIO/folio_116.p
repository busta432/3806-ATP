fof(premise_0, axiom, (![X] : ![Y] : (isMan(X) & isMan(Y) & taller(X, Y) => canBlock(X, Y)))).
fof(premise_1, axiom, (![X] : (isMan(X) & sameClass(X, michael) & ~be(X, michael) => taller(michael, X)))).
fof(premise_2, axiom, (![X] : ![Y] : ![Z] : ((taller(X, Y) & taller(Y, Z)) => taller(X, Z)))).
fof(premise_3, axiom, (isMan(peter) & taller(peter, michael))).
fof(premise_4, axiom, (![X] : (~jumpWhenShooting(X) => canBlock(michael, X)))).
fof(premise_5, axiom, (~canBlock(michael, windy))).
fof(premise_6, axiom, (![X] : (jumpWhenShooting(X) => greatShooter(X)))).
fof(conclusion, conjecture, (?[X] : (isMan(X) & sameClass(X, michael) & ~be(X, michael) & ~taller(peter, X)))).