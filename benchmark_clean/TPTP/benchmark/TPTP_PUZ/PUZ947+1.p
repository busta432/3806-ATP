%------------------------------------------------------------------------------
% File     : PUZ947+1
% Domain   : Puzzles
% Problem  : component has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(component_red, axiom, ( ! [X] : ((component(X) => red(X))) )).
fof(component_heavy, axiom, ( ! [X] : ((component(X) => heavy(X))) )).
fof(component_fragile, axiom, ( ! [X] : ((component(X) => fragile(X))) )).
fof(inst, axiom, ( component(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
