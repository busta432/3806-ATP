%------------------------------------------------------------------------------
% File     : PUZ936+1
% Domain   : Puzzles
% Problem  : gadget has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(gadget_blue, axiom, ( ! [X] : ((gadget(X) => blue(X))) )).
fof(gadget_light, axiom, ( ! [X] : ((gadget(X) => light(X))) )).
fof(gadget_durable, axiom, ( ! [X] : ((gadget(X) => durable(X))) )).
fof(inst, axiom, ( gadget(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
