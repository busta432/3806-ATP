%------------------------------------------------------------------------------
% File     : PUZ941+1
% Domain   : Puzzles
% Problem  : device has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(device_green, axiom, ( ! [X] : ((device(X) => green(X))) )).
fof(device_medium, axiom, ( ! [X] : ((device(X) => medium(X))) )).
fof(device_flexible, axiom, ( ! [X] : ((device(X) => flexible(X))) )).
fof(inst, axiom, ( device(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
