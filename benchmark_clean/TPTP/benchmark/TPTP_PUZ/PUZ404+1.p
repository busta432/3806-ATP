%------------------------------------------------------------------------------
% File     : PUZ404+1
% Domain   : Puzzles
% Problem  : Mutual exclusion 4 states
% Status   : Theorem
% Rating   : 0.32 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cover, axiom, ( ! [X] : (state0(X) | state1(X) | state2(X) | state3(X)) )).
fof(mx01, axiom, ( ! [X] : (~(state0(X) & state1(X))) )).
fof(mx02, axiom, ( ! [X] : (~(state0(X) & state2(X))) )).
fof(mx03, axiom, ( ! [X] : (~(state0(X) & state3(X))) )).
fof(mx12, axiom, ( ! [X] : (~(state1(X) & state2(X))) )).
fof(mx13, axiom, ( ! [X] : (~(state1(X) & state3(X))) )).
fof(mx23, axiom, ( ! [X] : (~(state2(X) & state3(X))) )).
fof(not0, axiom, ( ! [X] : (~state0(X)) )).
fof(not1, axiom, ( ! [X] : (~state1(X)) )).
fof(not2, axiom, ( ! [X] : (~state2(X)) )).
fof(goal, conjecture, ( ! [X] : (state3(X)) )).
%------------------------------------------------------------------------------
