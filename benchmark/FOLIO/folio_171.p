fof(premise_0, axiom, (![X] : (deadlyDiseases(X) => survivalRateIsLow(X)))).
fof(premise_1, axiom, (![X] : (severeCancer(X) => deadlyDiseases(X)))).
fof(premise_2, axiom, (![X] : (bileDuctCancer(X) => severeCancer(X)))).
fof(premise_3, axiom, (![X] : (cholangiocarcinoma(X) => bileDuctCancer(X)))).
fof(premise_4, axiom, (![X] : (mildFlu(X) => ~survivalRateIsLow(X)))).
fof(premise_5, axiom, (bileDuctCancer(colorectalCancer) | survivalRateIsLow(colorectalCancer) => ~bileDuctCancer(colorectalCancer))).
fof(conclusion, conjecture, (severeCancer(colorectalCancer))).