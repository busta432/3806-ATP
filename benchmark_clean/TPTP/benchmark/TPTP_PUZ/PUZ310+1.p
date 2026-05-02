%------------------------------------------------------------------------------
% File     : PUZ310+1
% Domain   : Puzzles
% Problem  : Classification hawk is animal
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((bird(X) => vertebrate(X))) )).
fof(mid_top, axiom, ( ! [X] : ((vertebrate(X) => animal(X))) )).
fof(inst, axiom, ( bird(hawk) )).
fof(goal, conjecture, ( animal(hawk) )).
%------------------------------------------------------------------------------
