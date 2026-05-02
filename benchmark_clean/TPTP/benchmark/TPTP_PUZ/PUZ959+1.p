%------------------------------------------------------------------------------
% File     : PUZ959+1
% Domain   : Puzzles
% Problem  : part has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(part_red, axiom, ( ! [X] : ((part(X) => red(X))) )).
fof(part_heavy, axiom, ( ! [X] : ((part(X) => heavy(X))) )).
fof(part_fragile, axiom, ( ! [X] : ((part(X) => fragile(X))) )).
fof(inst, axiom, ( part(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
