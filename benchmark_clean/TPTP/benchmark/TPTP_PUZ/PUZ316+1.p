%------------------------------------------------------------------------------
% File     : PUZ316+1
% Domain   : Puzzles
% Problem  : Classification rose is organism
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((flower(X) => plant(X))) )).
fof(mid_top, axiom, ( ! [X] : ((plant(X) => organism(X))) )).
fof(inst, axiom, ( flower(rose) )).
fof(goal, conjecture, ( organism(rose) )).
%------------------------------------------------------------------------------
