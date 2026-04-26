fof(premise_0, axiom, (![X] : (yelpRecommendation(X) => ~negativeReview(X)))).
fof(premise_1, axiom, (![X] : (ratingGreaterThan9(X) => yelpRecommendation(X)))).
fof(premise_2, axiom, (?[X] : (noTakeOutService(X) & negativeReview(X)))).
fof(premise_3, axiom, (![X] : (popularAmongLocalResidents(X) => ratingGreaterThan9(X)))).
fof(premise_4, axiom, (ratingGreaterThan9(subway) <~> popularAmongLocalResidents(subway))).
fof(conclusion, conjecture, (noTakeOutService(subway))).