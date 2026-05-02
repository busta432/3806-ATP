%------------------------------------------------------------------------------
% File     : PUZ308+1
% Domain   : Puzzles
% Problem  : Classification penguin is animal
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((bird(X) => vertebrate(X))) )).
fof(mid_top, axiom, ( ! [X] : ((vertebrate(X) => animal(X))) )).
fof(inst, axiom, ( bird(penguin) )).
fof(goal, conjecture, ( animal(penguin) )).
%------------------------------------------------------------------------------
