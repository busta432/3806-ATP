%------------------------------------------------------------------------------
% File     : PUZ952+1
% Domain   : Puzzles
% Problem  : module has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(module_blue, axiom, ( ! [X] : ((module(X) => blue(X))) )).
fof(module_light, axiom, ( ! [X] : ((module(X) => light(X))) )).
fof(module_durable, axiom, ( ! [X] : ((module(X) => durable(X))) )).
fof(inst, axiom, ( module(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
