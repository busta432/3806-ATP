fof(premise_0, axiom, (publishingHouse(newvesselpress) & specializesIn(newvessel, translatingforeignliteratureintoenglish))).
fof(premise_1, axiom, (![X] : (book(X) & publishedBy(X, newvesselpress) => in(X, english)))).
fof(premise_2, axiom, (book(neapolitanchronicles) & publishedBy(neapolitanchronicles, newvesselpress))).
fof(premise_3, axiom, (translatedFrom(neapolitanchronicles, italian))).
fof(premise_4, axiom, (book(palaceofflies) & publishedBy(palaceofflies, newvesselpress))).
fof(conclusion, conjecture, (publishedBy(harrrypotter, newvesselpress))).