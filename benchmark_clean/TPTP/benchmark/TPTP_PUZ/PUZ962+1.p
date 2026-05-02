%------------------------------------------------------------------------------
% File     : PUZ962+1
% Domain   : Puzzles
% Problem  : part has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(part_yellow, axiom, ( ! [X] : ((part(X) => yellow(X))) )).
fof(part_compact, axiom, ( ! [X] : ((part(X) => compact(X))) )).
fof(part_portable, axiom, ( ! [X] : ((part(X) => portable(X))) )).
fof(inst, axiom, ( part(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
