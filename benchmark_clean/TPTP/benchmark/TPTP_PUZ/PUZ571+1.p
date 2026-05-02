%------------------------------------------------------------------------------
% File     : PUZ571+1
% Domain   : Puzzles
% Problem  : truck has property is_transport
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((vehicle(X) => is_transport(X))) )).
fof(is_cat, axiom, ( vehicle(truck) )).
fof(goal, conjecture, ( is_transport(truck) )).
%------------------------------------------------------------------------------
