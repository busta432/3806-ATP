%------------------------------------------------------------------------------
% File     : PUZ943+1
% Domain   : Puzzles
% Problem  : tool has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(tool_red, axiom, ( ! [X] : ((tool(X) => red(X))) )).
fof(tool_heavy, axiom, ( ! [X] : ((tool(X) => heavy(X))) )).
fof(tool_fragile, axiom, ( ! [X] : ((tool(X) => fragile(X))) )).
fof(inst, axiom, ( tool(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
