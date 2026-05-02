%------------------------------------------------------------------------------
% File     : PUZ946+1
% Domain   : Puzzles
% Problem  : tool has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(tool_yellow, axiom, ( ! [X] : ((tool(X) => yellow(X))) )).
fof(tool_compact, axiom, ( ! [X] : ((tool(X) => compact(X))) )).
fof(tool_portable, axiom, ( ! [X] : ((tool(X) => portable(X))) )).
fof(inst, axiom, ( tool(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
