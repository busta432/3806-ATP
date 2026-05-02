%------------------------------------------------------------------------------
% File     : PUZ961+1
% Domain   : Puzzles
% Problem  : part has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(part_green, axiom, ( ! [X] : ((part(X) => green(X))) )).
fof(part_medium, axiom, ( ! [X] : ((part(X) => medium(X))) )).
fof(part_flexible, axiom, ( ! [X] : ((part(X) => flexible(X))) )).
fof(inst, axiom, ( part(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
