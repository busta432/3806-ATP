%------------------------------------------------------------------------------
% File     : PUZ588+1
% Domain   : Puzzles
% Problem  : cherry has property has_seeds
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => has_seeds(X))) )).
fof(is_cat, axiom, ( fruit(cherry) )).
fof(goal, conjecture, ( has_seeds(cherry) )).
%------------------------------------------------------------------------------
