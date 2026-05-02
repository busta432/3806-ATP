%------------------------------------------------------------------------------
% File     : PUZ303+1
% Domain   : Puzzles
% Problem  : Classification beagle is animal
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((dog(X) => mammal(X))) )).
fof(mid_top, axiom, ( ! [X] : ((mammal(X) => animal(X))) )).
fof(inst, axiom, ( dog(beagle) )).
fof(goal, conjecture, ( animal(beagle) )).
%------------------------------------------------------------------------------
