%------------------------------------------------------------------------------
% File     : PUZ557+1
% Domain   : Puzzles
% Problem  : motorcycle has property needs_fuel
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((vehicle(X) => needs_fuel(X))) )).
fof(is_cat, axiom, ( vehicle(motorcycle) )).
fof(goal, conjecture, ( needs_fuel(motorcycle) )).
%------------------------------------------------------------------------------
