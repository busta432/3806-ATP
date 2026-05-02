%------------------------------------------------------------------------------
% File     : PUZ937+1
% Domain   : Puzzles
% Problem  : gadget has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(gadget_green, axiom, ( ! [X] : ((gadget(X) => green(X))) )).
fof(gadget_medium, axiom, ( ! [X] : ((gadget(X) => medium(X))) )).
fof(gadget_flexible, axiom, ( ! [X] : ((gadget(X) => flexible(X))) )).
fof(inst, axiom, ( gadget(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
