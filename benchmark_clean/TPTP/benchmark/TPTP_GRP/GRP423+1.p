%------------------------------------------------------------------------------
% File     : GRP423+1
% Domain   : Group Theory
% Problem  : Abelian commutativity 14 elements
% Status   : Theorem
% Rating   : 0.40 v1.0.0
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
fof(p2, axiom, ( product(a2,a3,r2) )).
fof(p3, axiom, ( product(a3,a4,r3) )).
fof(p4, axiom, ( product(a4,a5,r4) )).
fof(p5, axiom, ( product(a5,a6,r5) )).
fof(p6, axiom, ( product(a6,a7,r6) )).
fof(p7, axiom, ( product(a7,a8,r7) )).
fof(p8, axiom, ( product(a8,a9,r8) )).
fof(p9, axiom, ( product(a9,a10,r9) )).
fof(p10, axiom, ( product(a10,a11,r10) )).
fof(p11, axiom, ( product(a11,a12,r11) )).
fof(p12, axiom, ( product(a12,a13,r12) )).
fof(goal, conjecture, ( product(a1,a0,r0) )).
%------------------------------------------------------------------------------
