%------------------------------------------------------------------------------
% File     : PUZ944+1
% Domain   : Puzzles
% Problem  : tool has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(tool_blue, axiom, ( ! [X] : ((tool(X) => blue(X))) )).
fof(tool_light, axiom, ( ! [X] : ((tool(X) => light(X))) )).
fof(tool_durable, axiom, ( ! [X] : ((tool(X) => durable(X))) )).
fof(inst, axiom, ( tool(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
