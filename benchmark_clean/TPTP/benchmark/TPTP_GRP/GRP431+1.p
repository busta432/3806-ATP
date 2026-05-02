%------------------------------------------------------------------------------
% File     : GRP431+1
% Domain   : Group Theory
% Problem  : Cyclic group order 9
% Status   : Theorem
% Rating   : 0.55 v1.0.0
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
fof(pow4, axiom, ( product(a_pow4,a,a_pow5) )).
fof(pow5, axiom, ( product(a_pow5,a,a_pow6) )).
fof(pow6, axiom, ( product(a_pow6,a,a_pow7) )).
fof(pow7, axiom, ( product(a_pow7,a,a_pow8) )).
fof(pow8, axiom, ( product(a_pow8,a,a_pow9) )).
fof(cyclic, axiom, ( product(a_pow9,a,e) )).
fof(goal, conjecture, ( ? [N] : (product(a,N,e)) )).
%------------------------------------------------------------------------------
