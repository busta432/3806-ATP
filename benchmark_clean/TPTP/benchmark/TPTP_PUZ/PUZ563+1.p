%------------------------------------------------------------------------------
% File     : PUZ563+1
% Domain   : Puzzles
% Problem  : truck has property has_engine
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((vehicle(X) => has_engine(X))) )).
fof(is_cat, axiom, ( vehicle(truck) )).
fof(goal, conjecture, ( has_engine(truck) )).
%------------------------------------------------------------------------------
