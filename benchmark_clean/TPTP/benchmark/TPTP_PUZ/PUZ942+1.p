%------------------------------------------------------------------------------
% File     : PUZ942+1
% Domain   : Puzzles
% Problem  : device has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(device_yellow, axiom, ( ! [X] : ((device(X) => yellow(X))) )).
fof(device_compact, axiom, ( ! [X] : ((device(X) => compact(X))) )).
fof(device_portable, axiom, ( ! [X] : ((device(X) => portable(X))) )).
fof(inst, axiom, ( device(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
