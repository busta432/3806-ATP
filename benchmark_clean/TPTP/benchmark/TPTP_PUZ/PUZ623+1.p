%------------------------------------------------------------------------------
% File     : PUZ623+1
% Domain   : Puzzles
% Problem  : parrot has property needs_food
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => needs_food(X))) )).
fof(is_cat, axiom, ( animal(parrot) )).
fof(goal, conjecture, ( needs_food(parrot) )).
%------------------------------------------------------------------------------
