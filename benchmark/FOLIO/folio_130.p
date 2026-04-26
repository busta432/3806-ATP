fof(premise_0, axiom, (![X] : (wedding(X) => child(X)))).
fof(premise_1, axiom, (![X] : (paris(X) => wedding(X)))).
fof(premise_2, axiom, (![X] : (july(X) => paris(X)))).
fof(premise_3, axiom, (?[X] : (july(X) & wellAttended(X)))).
fof(premise_4, axiom, (child(john) => ~(paris(john) & wedding(john)))).
fof(premise_5, axiom, (wellAttended(john) => july(john) <~> paris(john))).
fof(conclusion, conjecture, (~wellAttended(john))).