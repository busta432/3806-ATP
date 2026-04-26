fof(premise_0, axiom, (![X] : (book(X) => knowledge(X)))).
fof(premise_1, axiom, (![X] : ![Y] : (readBook(X, Y) => gainKnowledge(X)))).
fof(premise_2, axiom, (![X] : (gainKnowledge(X) => smarter(X)))).
fof(premise_3, axiom, (readBook(harry, walden) & book(walden))).
fof(conclusion, conjecture, (![X] : (smarter(X) => gainKnowledge(X)))).