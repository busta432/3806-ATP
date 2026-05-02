%------------------------------------------------------------------------------
% File     : PUZ945+1
% Domain   : Puzzles
% Problem  : tool has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(tool_green, axiom, ( ! [X] : ((tool(X) => green(X))) )).
fof(tool_medium, axiom, ( ! [X] : ((tool(X) => medium(X))) )).
fof(tool_flexible, axiom, ( ! [X] : ((tool(X) => flexible(X))) )).
fof(inst, axiom, ( tool(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
