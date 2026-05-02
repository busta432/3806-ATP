%------------------------------------------------------------------------------
% File     : PUZ111+1
% Domain   : Puzzles
% Problem  : Reachability 11-step chain
% Status   : Theorem
% Rating   : 0.44 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((edge(X,Y) & reach(Y,Z) => reach(X,Z))) )).
fof(base, axiom, ( ! [X,Y] : ((edge(X,Y) => reach(X,Y))) )).
fof(e1, axiom, ( edge(n0,n1) )).
fof(e2, axiom, ( edge(n1,n2) )).
fof(e3, axiom, ( edge(n2,n3) )).
fof(e4, axiom, ( edge(n3,n4) )).
fof(e5, axiom, ( edge(n4,n5) )).
fof(e6, axiom, ( edge(n5,n6) )).
fof(e7, axiom, ( edge(n6,n7) )).
fof(e8, axiom, ( edge(n7,n8) )).
fof(e9, axiom, ( edge(n8,n9) )).
fof(e10, axiom, ( edge(n9,n10) )).
fof(e11, axiom, ( edge(n10,n11) )).
fof(goal, conjecture, ( reach(n0,n11) )).
%------------------------------------------------------------------------------
