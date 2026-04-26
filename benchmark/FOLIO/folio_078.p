fof(premise_0, axiom, (![X] : (studentJobs(X) => tuition(X)))).
fof(premise_1, axiom, (![X] : (takeout(X) => studentJobs(X)))).
fof(premise_2, axiom, (![X] : (takeout(X) | diningHall(X)))).
fof(premise_3, axiom, (![X] : (diningHall(X) => notPicky(X)))).
fof(premise_4, axiom, (![X] : (diningHall(X) => eating(X)))).
fof(premise_5, axiom, (studentJobs(mary) & tuition(mary) => ~(notPicky(mary) | tuition(mary)))).
fof(conclusion, conjecture, (notPicky(mary) & eating(mary))).