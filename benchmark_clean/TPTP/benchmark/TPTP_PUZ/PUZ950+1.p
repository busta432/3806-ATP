%------------------------------------------------------------------------------
% File     : PUZ950+1
% Domain   : Puzzles
% Problem  : component has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(component_yellow, axiom, ( ! [X] : ((component(X) => yellow(X))) )).
fof(component_compact, axiom, ( ! [X] : ((component(X) => compact(X))) )).
fof(component_portable, axiom, ( ! [X] : ((component(X) => portable(X))) )).
fof(inst, axiom, ( component(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
