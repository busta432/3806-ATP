%------------------------------------------------------------------------------
% File     : PUZ407+1
% Domain   : Puzzles
% Problem  : Mutual exclusion 7 states
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cover, axiom, ( ! [X] : (state0(X) | state1(X) | state2(X) | state3(X) | state4(X) | state5(X) | state6(X)) )).
fof(mx01, axiom, ( ! [X] : (~(state0(X) & state1(X))) )).
fof(mx02, axiom, ( ! [X] : (~(state0(X) & state2(X))) )).
fof(mx03, axiom, ( ! [X] : (~(state0(X) & state3(X))) )).
fof(mx04, axiom, ( ! [X] : (~(state0(X) & state4(X))) )).
fof(mx05, axiom, ( ! [X] : (~(state0(X) & state5(X))) )).
fof(mx06, axiom, ( ! [X] : (~(state0(X) & state6(X))) )).
fof(mx12, axiom, ( ! [X] : (~(state1(X) & state2(X))) )).
fof(mx13, axiom, ( ! [X] : (~(state1(X) & state3(X))) )).
fof(mx14, axiom, ( ! [X] : (~(state1(X) & state4(X))) )).
fof(mx15, axiom, ( ! [X] : (~(state1(X) & state5(X))) )).
fof(mx16, axiom, ( ! [X] : (~(state1(X) & state6(X))) )).
fof(mx23, axiom, ( ! [X] : (~(state2(X) & state3(X))) )).
fof(mx24, axiom, ( ! [X] : (~(state2(X) & state4(X))) )).
fof(mx25, axiom, ( ! [X] : (~(state2(X) & state5(X))) )).
fof(mx26, axiom, ( ! [X] : (~(state2(X) & state6(X))) )).
fof(mx34, axiom, ( ! [X] : (~(state3(X) & state4(X))) )).
fof(mx35, axiom, ( ! [X] : (~(state3(X) & state5(X))) )).
fof(mx36, axiom, ( ! [X] : (~(state3(X) & state6(X))) )).
fof(mx45, axiom, ( ! [X] : (~(state4(X) & state5(X))) )).
fof(mx46, axiom, ( ! [X] : (~(state4(X) & state6(X))) )).
fof(mx56, axiom, ( ! [X] : (~(state5(X) & state6(X))) )).
fof(not0, axiom, ( ! [X] : (~state0(X)) )).
fof(not1, axiom, ( ! [X] : (~state1(X)) )).
fof(not2, axiom, ( ! [X] : (~state2(X)) )).
fof(not3, axiom, ( ! [X] : (~state3(X)) )).
fof(not4, axiom, ( ! [X] : (~state4(X)) )).
fof(not5, axiom, ( ! [X] : (~state5(X)) )).
fof(goal, conjecture, ( ! [X] : (state6(X)) )).
%------------------------------------------------------------------------------
