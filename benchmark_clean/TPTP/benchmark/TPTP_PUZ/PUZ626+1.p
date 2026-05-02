%------------------------------------------------------------------------------
% File     : PUZ626+1
% Domain   : Puzzles
% Problem  : cat has property can_move
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => can_move(X))) )).
fof(is_cat, axiom, ( animal(cat) )).
fof(goal, conjecture, ( can_move(cat) )).
%------------------------------------------------------------------------------
