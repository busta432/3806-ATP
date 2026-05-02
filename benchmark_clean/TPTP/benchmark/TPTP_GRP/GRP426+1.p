%------------------------------------------------------------------------------
% File     : GRP426+1
% Domain   : Group Theory
% Problem  : Cyclic group order 4
% Status   : Theorem
% Rating   : 0.32 v1.0.0
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
fof(pow1, axiom, ( product(a,a,a_pow2) )).
fof(pow2, axiom, ( product(a_pow2,a,a_pow3) )).
fof(pow3, axiom, ( product(a_pow3,a,a_pow4) )).
fof(cyclic, axiom, ( product(a_pow4,a,e) )).
fof(goal, conjecture, ( ? [N] : (product(a,N,e)) )).
%------------------------------------------------------------------------------
