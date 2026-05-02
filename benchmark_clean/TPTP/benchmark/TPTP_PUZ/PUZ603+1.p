%------------------------------------------------------------------------------
% File     : PUZ603+1
% Domain   : Puzzles
% Problem  : banana has property is_food
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => is_food(X))) )).
fof(is_cat, axiom, ( fruit(banana) )).
fof(goal, conjecture, ( is_food(banana) )).
%------------------------------------------------------------------------------
