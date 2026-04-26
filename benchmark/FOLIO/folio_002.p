fof(premise_0, axiom, (![X] : (talentShows(X) => engaged(X)))).
fof(premise_1, axiom, (![X] : (talentShows(X) | inactive(X)))).
fof(premise_2, axiom, (![X] : (chaperone(X) => ~students(X)))).
fof(premise_3, axiom, (![X] : (inactive(X) => chaperone(X)))).
fof(premise_4, axiom, (![X] : (academicCareer(X) => students(X)))).
fof(premise_5, axiom, ((engaged(bonnie) & students(bonnie)) <~> (~engaged(bonnie) & ~students(bonnie)))).
fof(conclusion, conjecture, (academicCareer(bonnie) <~> chaperone(bonnie) => academicCareer(bonnie) <~> inactive(bonnie))).