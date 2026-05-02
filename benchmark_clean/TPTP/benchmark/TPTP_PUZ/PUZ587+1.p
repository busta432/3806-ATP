%------------------------------------------------------------------------------
% File     : PUZ587+1
% Domain   : Puzzles
% Problem  : banana has property has_seeds
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => has_seeds(X))) )).
fof(is_cat, axiom, ( fruit(banana) )).
fof(goal, conjecture, ( has_seeds(banana) )).
%------------------------------------------------------------------------------
