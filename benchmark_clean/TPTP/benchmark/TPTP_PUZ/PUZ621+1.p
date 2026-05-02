%------------------------------------------------------------------------------
% File     : PUZ621+1
% Domain   : Puzzles
% Problem  : rabbit has property needs_food
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => needs_food(X))) )).
fof(is_cat, axiom, ( animal(rabbit) )).
fof(goal, conjecture, ( needs_food(rabbit) )).
%------------------------------------------------------------------------------
