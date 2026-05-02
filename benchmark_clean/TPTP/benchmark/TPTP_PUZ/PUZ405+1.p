%------------------------------------------------------------------------------
% File     : PUZ405+1
% Domain   : Puzzles
% Problem  : Mutual exclusion 5 states
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cover, axiom, ( ! [X] : (state0(X) | state1(X) | state2(X) | state3(X) | state4(X)) )).
fof(mx01, axiom, ( ! [X] : (~(state0(X) & state1(X))) )).
fof(mx02, axiom, ( ! [X] : (~(state0(X) & state2(X))) )).
fof(mx03, axiom, ( ! [X] : (~(state0(X) & state3(X))) )).
fof(mx04, axiom, ( ! [X] : (~(state0(X) & state4(X))) )).
fof(mx12, axiom, ( ! [X] : (~(state1(X) & state2(X))) )).
fof(mx13, axiom, ( ! [X] : (~(state1(X) & state3(X))) )).
fof(mx14, axiom, ( ! [X] : (~(state1(X) & state4(X))) )).
fof(mx23, axiom, ( ! [X] : (~(state2(X) & state3(X))) )).
fof(mx24, axiom, ( ! [X] : (~(state2(X) & state4(X))) )).
fof(mx34, axiom, ( ! [X] : (~(state3(X) & state4(X))) )).
fof(not0, axiom, ( ! [X] : (~state0(X)) )).
fof(not1, axiom, ( ! [X] : (~state1(X)) )).
fof(not2, axiom, ( ! [X] : (~state2(X)) )).
fof(not3, axiom, ( ! [X] : (~state3(X)) )).
fof(goal, conjecture, ( ! [X] : (state4(X)) )).
%------------------------------------------------------------------------------
