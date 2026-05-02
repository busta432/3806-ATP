%------------------------------------------------------------------------------
% File     : PUZ591+1
% Domain   : Puzzles
% Problem  : fig has property has_seeds
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((fruit(X) => has_seeds(X))) )).
fof(is_cat, axiom, ( fruit(fig) )).
fof(goal, conjecture, ( has_seeds(fig) )).
%------------------------------------------------------------------------------
