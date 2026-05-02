%------------------------------------------------------------------------------
% File     : PUZ954+1
% Domain   : Puzzles
% Problem  : module has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(module_yellow, axiom, ( ! [X] : ((module(X) => yellow(X))) )).
fof(module_compact, axiom, ( ! [X] : ((module(X) => compact(X))) )).
fof(module_portable, axiom, ( ! [X] : ((module(X) => portable(X))) )).
fof(inst, axiom, ( module(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
