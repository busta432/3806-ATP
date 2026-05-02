%------------------------------------------------------------------------------
% File     : PUZ318+1
% Domain   : Puzzles
% Problem  : Classification daisy is organism
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((flower(X) => plant(X))) )).
fof(mid_top, axiom, ( ! [X] : ((plant(X) => organism(X))) )).
fof(inst, axiom, ( flower(daisy) )).
fof(goal, conjecture, ( organism(daisy) )).
%------------------------------------------------------------------------------
