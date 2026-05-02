%------------------------------------------------------------------------------
% File     : PUZ622+1
% Domain   : Puzzles
% Problem  : turtle has property needs_food
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => needs_food(X))) )).
fof(is_cat, axiom, ( animal(turtle) )).
fof(goal, conjecture, ( needs_food(turtle) )).
%------------------------------------------------------------------------------
