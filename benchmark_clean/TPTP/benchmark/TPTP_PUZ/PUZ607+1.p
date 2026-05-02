%------------------------------------------------------------------------------
% File     : PUZ607+1
% Domain   : Puzzles
% Problem  : fig has property is_food
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => is_food(X))) )).
fof(is_cat, axiom, ( fruit(fig) )).
fof(goal, conjecture, ( is_food(fig) )).
%------------------------------------------------------------------------------
