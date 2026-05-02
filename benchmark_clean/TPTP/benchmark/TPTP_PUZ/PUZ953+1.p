%------------------------------------------------------------------------------
% File     : PUZ953+1
% Domain   : Puzzles
% Problem  : module has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(module_green, axiom, ( ! [X] : ((module(X) => green(X))) )).
fof(module_medium, axiom, ( ! [X] : ((module(X) => medium(X))) )).
fof(module_flexible, axiom, ( ! [X] : ((module(X) => flexible(X))) )).
fof(inst, axiom, ( module(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
