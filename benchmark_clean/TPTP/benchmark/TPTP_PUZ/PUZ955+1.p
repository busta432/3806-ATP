%------------------------------------------------------------------------------
% File     : PUZ955+1
% Domain   : Puzzles
% Problem  : unit has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(unit_red, axiom, ( ! [X] : ((unit(X) => red(X))) )).
fof(unit_heavy, axiom, ( ! [X] : ((unit(X) => heavy(X))) )).
fof(unit_fragile, axiom, ( ! [X] : ((unit(X) => fragile(X))) )).
fof(inst, axiom, ( unit(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
