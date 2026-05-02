%------------------------------------------------------------------------------
% File     : PUZ403+1
% Domain   : Puzzles
% Problem  : Mutual exclusion 3 states
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cover, axiom, ( ! [X] : (state0(X) | state1(X) | state2(X)) )).
fof(mx01, axiom, ( ! [X] : (~(state0(X) & state1(X))) )).
fof(mx02, axiom, ( ! [X] : (~(state0(X) & state2(X))) )).
fof(mx12, axiom, ( ! [X] : (~(state1(X) & state2(X))) )).
fof(not0, axiom, ( ! [X] : (~state0(X)) )).
fof(not1, axiom, ( ! [X] : (~state1(X)) )).
fof(goal, conjecture, ( ! [X] : (state2(X)) )).
%------------------------------------------------------------------------------
