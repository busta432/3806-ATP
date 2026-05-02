%------------------------------------------------------------------------------
% File     : PUZ948+1
% Domain   : Puzzles
% Problem  : component has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(component_blue, axiom, ( ! [X] : ((component(X) => blue(X))) )).
fof(component_light, axiom, ( ! [X] : ((component(X) => light(X))) )).
fof(component_durable, axiom, ( ! [X] : ((component(X) => durable(X))) )).
fof(inst, axiom, ( component(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
