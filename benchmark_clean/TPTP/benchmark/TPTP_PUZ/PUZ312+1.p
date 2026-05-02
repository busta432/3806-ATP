%------------------------------------------------------------------------------
% File     : PUZ312+1
% Domain   : Puzzles
% Problem  : Classification trout is animal
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((fish(X) => vertebrate(X))) )).
fof(mid_top, axiom, ( ! [X] : ((vertebrate(X) => animal(X))) )).
fof(inst, axiom, ( fish(trout) )).
fof(goal, conjecture, ( animal(trout) )).
%------------------------------------------------------------------------------
