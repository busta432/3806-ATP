%------------------------------------------------------------------------------
% File     : GRP412+1
% Domain   : Group Theory
% Problem  : Abelian commutativity 3 elements
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [GRP]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(closure, axiom, ( ! [X,Y] : (? [Z] : (product(X,Y,Z))) )).
fof(func, axiom, ( ! [X,Y,Z1,Z2] : ((product(X,Y,Z1) & product(X,Y,Z2) => Z1 = Z2)) )).
fof(assoc, axiom, ( ! [X,Y,Z,XY,YZ,R1,R2] : ((product(X,Y,XY) & product(Y,Z,YZ) & product(XY,Z,R1) & product(X,YZ,R2) => R1 = R2)) )).
fof(lid, axiom, ( ! [X] : (product(e,X,X)) )).
fof(rid, axiom, ( ! [X] : (product(X,e,X)) )).
fof(linv, axiom, ( ! [X] : (? [Y] : (product(Y,X,e))) )).
fof(rinv, axiom, ( ! [X] : (? [Y] : (product(X,Y,e))) )).
fof(comm, axiom, ( ! [X,Y,Z] : ((product(X,Y,Z) => product(Y,X,Z))) )).
fof(p0, axiom, ( product(a0,a1,r0) )).
fof(p1, axiom, ( product(a1,a2,r1) )).
fof(goal, conjecture, ( product(a1,a0,r0) )).
%------------------------------------------------------------------------------
