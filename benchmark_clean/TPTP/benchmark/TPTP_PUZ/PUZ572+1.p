%------------------------------------------------------------------------------
% File     : PUZ572+1
% Domain   : Puzzles
% Problem  : bus has property is_transport
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cat_prop, axiom, ( ! [X] : ((vehicle(X) => is_transport(X))) )).
fof(is_cat, axiom, ( vehicle(bus) )).
fof(goal, conjecture, ( is_transport(bus) )).
%------------------------------------------------------------------------------
