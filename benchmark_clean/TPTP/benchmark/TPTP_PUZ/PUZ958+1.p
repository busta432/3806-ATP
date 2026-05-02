%------------------------------------------------------------------------------
% File     : PUZ958+1
% Domain   : Puzzles
% Problem  : unit has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(unit_yellow, axiom, ( ! [X] : ((unit(X) => yellow(X))) )).
fof(unit_compact, axiom, ( ! [X] : ((unit(X) => compact(X))) )).
fof(unit_portable, axiom, ( ! [X] : ((unit(X) => portable(X))) )).
fof(inst, axiom, ( unit(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
