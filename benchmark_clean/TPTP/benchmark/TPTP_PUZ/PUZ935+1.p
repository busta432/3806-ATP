%------------------------------------------------------------------------------
% File     : PUZ935+1
% Domain   : Puzzles
% Problem  : gadget has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(gadget_red, axiom, ( ! [X] : ((gadget(X) => red(X))) )).
fof(gadget_heavy, axiom, ( ! [X] : ((gadget(X) => heavy(X))) )).
fof(gadget_fragile, axiom, ( ! [X] : ((gadget(X) => fragile(X))) )).
fof(inst, axiom, ( gadget(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
