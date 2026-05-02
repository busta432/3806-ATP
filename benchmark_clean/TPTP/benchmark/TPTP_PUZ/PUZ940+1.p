%------------------------------------------------------------------------------
% File     : PUZ940+1
% Domain   : Puzzles
% Problem  : device has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(device_blue, axiom, ( ! [X] : ((device(X) => blue(X))) )).
fof(device_light, axiom, ( ! [X] : ((device(X) => light(X))) )).
fof(device_durable, axiom, ( ! [X] : ((device(X) => durable(X))) )).
fof(inst, axiom, ( device(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
