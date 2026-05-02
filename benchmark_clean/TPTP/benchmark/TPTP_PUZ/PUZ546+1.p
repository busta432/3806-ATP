%------------------------------------------------------------------------------
% File     : PUZ546+1
% Domain   : Puzzles
% Problem  : car has property has_wheels
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((vehicle(X) => has_wheels(X))) )).
fof(is_cat, axiom, ( vehicle(car) )).
fof(goal, conjecture, ( has_wheels(car) )).
%------------------------------------------------------------------------------
