%------------------------------------------------------------------------------
% File     : PUZ957+1
% Domain   : Puzzles
% Problem  : unit has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(unit_green, axiom, ( ! [X] : ((unit(X) => green(X))) )).
fof(unit_medium, axiom, ( ! [X] : ((unit(X) => medium(X))) )).
fof(unit_flexible, axiom, ( ! [X] : ((unit(X) => flexible(X))) )).
fof(inst, axiom, ( unit(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
