%------------------------------------------------------------------------------
% File     : PUZ610+1
% Domain   : Puzzles
% Problem  : cat has property is_living
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((animal(X) => is_living(X))) )).
fof(is_cat, axiom, ( animal(cat) )).
fof(goal, conjecture, ( is_living(cat) )).
%------------------------------------------------------------------------------
