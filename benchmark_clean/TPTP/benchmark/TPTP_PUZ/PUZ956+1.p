%------------------------------------------------------------------------------
% File     : PUZ956+1
% Domain   : Puzzles
% Problem  : unit has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(unit_blue, axiom, ( ! [X] : ((unit(X) => blue(X))) )).
fof(unit_light, axiom, ( ! [X] : ((unit(X) => light(X))) )).
fof(unit_durable, axiom, ( ! [X] : ((unit(X) => durable(X))) )).
fof(inst, axiom, ( unit(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
