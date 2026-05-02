%------------------------------------------------------------------------------
% File     : PUZ951+1
% Domain   : Puzzles
% Problem  : module has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(module_red, axiom, ( ! [X] : ((module(X) => red(X))) )).
fof(module_heavy, axiom, ( ! [X] : ((module(X) => heavy(X))) )).
fof(module_fragile, axiom, ( ! [X] : ((module(X) => fragile(X))) )).
fof(inst, axiom, ( module(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
