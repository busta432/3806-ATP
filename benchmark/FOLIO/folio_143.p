fof(premise_0, axiom, (![X] : (funny(X) => popular(X)))).
fof(premise_1, axiom, (![X] : (ugly(X) => ~popular(X)))).
fof(premise_2, axiom, (![X] : (love(children, X) => funny(X)))).
fof(premise_3, axiom, (![X] : (simpsons(X) => love(children, X)))).
fof(premise_4, axiom, (![X] : (yellow(X) => simpsons(X)))).
fof(premise_5, axiom, (simpsons(ben) <~> funny(ben))).
fof(conclusion, conjecture, ((yellow(ben) & ugly(ben)) <~> (~yellow(ben) & ~ugly(ben)))).