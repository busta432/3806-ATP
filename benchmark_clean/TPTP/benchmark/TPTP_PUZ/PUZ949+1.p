%------------------------------------------------------------------------------
% File     : PUZ949+1
% Domain   : Puzzles
% Problem  : component has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(component_green, axiom, ( ! [X] : ((component(X) => green(X))) )).
fof(component_medium, axiom, ( ! [X] : ((component(X) => medium(X))) )).
fof(component_flexible, axiom, ( ! [X] : ((component(X) => flexible(X))) )).
fof(inst, axiom, ( component(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
