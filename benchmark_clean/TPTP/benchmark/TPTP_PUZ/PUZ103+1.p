%------------------------------------------------------------------------------
% File     : PUZ103+1
% Domain   : Puzzles
% Problem  : Reachability 3-step chain
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((edge(X,Y) & reach(Y,Z) => reach(X,Z))) )).
fof(base, axiom, ( ! [X,Y] : ((edge(X,Y) => reach(X,Y))) )).
fof(e1, axiom, ( edge(n0,n1) )).
fof(e2, axiom, ( edge(n1,n2) )).
fof(e3, axiom, ( edge(n2,n3) )).
fof(goal, conjecture, ( reach(n0,n3) )).
%------------------------------------------------------------------------------
