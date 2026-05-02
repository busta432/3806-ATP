%------------------------------------------------------------------------------
% File     : PUZ960+1
% Domain   : Puzzles
% Problem  : part has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(part_blue, axiom, ( ! [X] : ((part(X) => blue(X))) )).
fof(part_light, axiom, ( ! [X] : ((part(X) => light(X))) )).
fof(part_durable, axiom, ( ! [X] : ((part(X) => durable(X))) )).
fof(inst, axiom, ( part(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
