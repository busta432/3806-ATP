fof(premise_0, axiom, (![X] : (bakery(X) => ~spicy(X)))).
fof(premise_1, axiom, (![X] : (cupcakes(X) => bakery(X)))).
fof(premise_2, axiom, (![X] : (hotpot(X) => spicy(X)))).
fof(premise_3, axiom, (![X] : (productsOfBakedByMelissa(X) => cupcakes(X)))).
fof(premise_4, axiom, (spicy(driedThaiChilies) | bakery(driedThaiChilies) => hotpot(driedThaiChilies) | spicy(driedThaiChilies))).
fof(conclusion, conjecture, (hotpot(driedThaiChilies))).