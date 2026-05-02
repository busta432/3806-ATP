%------------------------------------------------------------------------------
% File     : PUZ633+1
% Domain   : Puzzles
% Problem  : goldfish has property can_move
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => can_move(X))) )).
fof(is_cat, axiom, ( animal(goldfish) )).
fof(goal, conjecture, ( can_move(goldfish) )).
%------------------------------------------------------------------------------
