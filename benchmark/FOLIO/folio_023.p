fof(premise_0, axiom, (netflixShow(strangerThings) & popular(strangerThings))).
fof(premise_1, axiom, (![X] : ((netflixShow(X) & popular(X)) => bingeWatch(karen, X)))).
fof(premise_2, axiom, (![X] : ((netflixShow(X) & bingeWatch(karen, X)) <=> download(karen, X)))).
fof(premise_3, axiom, (~download(karen, blackMirror))).
fof(premise_4, axiom, (netflixShow(blackMirror))).
fof(premise_5, axiom, (![X] : ((netflixShow(X) & bingeWatch(karen, X)) => share(X, lisa)))).
fof(conclusion, conjecture, (popular(blackMirror))).