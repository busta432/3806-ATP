%------------------------------------------------------------------------------
% File     : PUZ938+1
% Domain   : Puzzles
% Problem  : gadget has properties yellow,compact,portable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(gadget_yellow, axiom, ( ! [X] : ((gadget(X) => yellow(X))) )).
fof(gadget_compact, axiom, ( ! [X] : ((gadget(X) => compact(X))) )).
fof(gadget_portable, axiom, ( ! [X] : ((gadget(X) => portable(X))) )).
fof(inst, axiom, ( gadget(item1) )).
fof(goal, conjecture, ( yellow(item1) & compact(item1) & portable(item1) )).
%------------------------------------------------------------------------------
