%------------------------------------------------------------------------------
% File     : PUZ939+1
% Domain   : Puzzles
% Problem  : device has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(device_red, axiom, ( ! [X] : ((device(X) => red(X))) )).
fof(device_heavy, axiom, ( ! [X] : ((device(X) => heavy(X))) )).
fof(device_fragile, axiom, ( ! [X] : ((device(X) => fragile(X))) )).
fof(inst, axiom, ( device(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
