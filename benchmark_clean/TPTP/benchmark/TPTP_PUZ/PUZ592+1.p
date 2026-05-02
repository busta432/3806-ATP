%------------------------------------------------------------------------------
% File     : PUZ592+1
% Domain   : Puzzles
% Problem  : grape has property has_seeds
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => has_seeds(X))) )).
fof(is_cat, axiom, ( fruit(grape) )).
fof(goal, conjecture, ( has_seeds(grape) )).
%------------------------------------------------------------------------------
