fof(premise_0, axiom, (![X] : (digital(X) => ~analog(X)))).
fof(premise_1, axiom, (![X] : (printedText(X) => analog(X)))).
fof(premise_2, axiom, (![X] : (streamingService(X) => digital(X)))).
fof(premise_3, axiom, (![X] : (hardcoverBook(X) => printedText(X)))).
fof(premise_4, axiom, (streamingService(y1984) => hardcoverBook(y1984))).
fof(conclusion, conjecture, (printedText(y1984))).