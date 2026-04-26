fof(premise_0, axiom, (![X] : (GrowthCompanies’stocks(X) => priceVolatile(X)))).
fof(premise_1, axiom, (![X] : (priceVolatile(X) => ~suitableForRetirementRund(X)))).
fof(premise_2, axiom, (?[X] : (Companies’stocks(X) & GrowthCompanies’stocks(X)))).
fof(premise_3, axiom, (![X] : (MatureCompanies’stocks(X) => suitableForRetirementRund(X)))).
fof(premise_4, axiom, (MatureCompanies’stocks(kO))).
fof(conclusion, conjecture, (Companies’stocks(kO) & GrowthCompanies’stocks(kO))).