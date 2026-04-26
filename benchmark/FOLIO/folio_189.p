fof(premise_0, axiom, (?[X] : (basketballPlayer(X) & ~american(X)))).
fof(premise_1, axiom, (![X] : (basketballPlayer(X) => tall(X)))).
fof(premise_2, axiom, (![X] : (tall(X) => wearLargeShoes(X)))).
fof(premise_3, axiom, (![X] : (wearLargeShoes(X) => wearLargeClothes(X)))).
fof(premise_4, axiom, (~wearLargeClothes(yuri))).
fof(conclusion, conjecture, (american(yuri))).