fof(premise_0, axiom, (![X] : (Mammal (X)=> Animal (X)))).
fof(premise_1, axiom, (![X] : (Monkey (X)=> Mammal (X)))).
fof(premise_2, axiom, (![X] : ( Monkey (X) | Bird (X)))).
fof(premise_3, axiom, (![X] : (Bird (X)=> Fly (X)))).
fof(premise_4, axiom, (![X] : (Animal (X)=> Breathe (X)))).
fof(premise_5, axiom, (![X] : (Fly (X)=> HaveWings (X)))).
fof(premise_6, axiom, (~ Fly (rock) & ~ Bird (rock) => ~ Fly (rock) & ~ Breathe (rock))).
fof(conclusion, conjecture, (haveWings(rock))).