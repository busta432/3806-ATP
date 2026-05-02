%------------------------------------------------------------------------------
% File     : PUZ402+1
% Domain   : Puzzles
% Problem  : Mutual exclusion 2 states
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cover, axiom, ( ! [X] : (state0(X) | state1(X)) )).
fof(mx01, axiom, ( ! [X] : (~(state0(X) & state1(X))) )).
fof(not0, axiom, ( ! [X] : (~state0(X)) )).
fof(goal, conjecture, ( ! [X] : (state1(X)) )).
%------------------------------------------------------------------------------
