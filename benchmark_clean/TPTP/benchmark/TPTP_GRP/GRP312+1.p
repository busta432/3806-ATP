%------------------------------------------------------------------------------
% File     : GRP312+1
% Domain   : Group Theory
% Problem  : Group product chain 14 elements
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [GRP]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(closure, axiom, ( ! [X,Y] : (? [Z] : (product(X,Y,Z))) )).
fof(func, axiom, ( ! [X,Y,Z1,Z2] : ((product(X,Y,Z1) & product(X,Y,Z2) => Z1 = Z2)) )).
fof(assoc, axiom, ( ! [X,Y,Z,XY,YZ,XYZ1,XYZ2] : ((product(X,Y,XY) & product(Y,Z,YZ) & product(XY,Z,XYZ1) & product(X,YZ,XYZ2) => XYZ1 = XYZ2)) )).
fof(left_id, axiom, ( ! [X] : (product(e,X,X)) )).
fof(right_id, axiom, ( ! [X] : (product(X,e,X)) )).
fof(left_inv, axiom, ( ! [X] : (? [Y] : (product(Y,X,e))) )).
fof(right_inv, axiom, ( ! [X] : (? [Y] : (product(X,Y,e))) )).
fof(p0, axiom, ( product(a0,a1,res0) )).
fof(p1, axiom, ( product(a1,a2,res1) )).
fof(p2, axiom, ( product(a2,a3,res2) )).
fof(p3, axiom, ( product(a3,a4,res3) )).
fof(p4, axiom, ( product(a4,a5,res4) )).
fof(p5, axiom, ( product(a5,a6,res5) )).
fof(p6, axiom, ( product(a6,a7,res6) )).
fof(p7, axiom, ( product(a7,a8,res7) )).
fof(p8, axiom, ( product(a8,a9,res8) )).
fof(p9, axiom, ( product(a9,a10,res9) )).
fof(p10, axiom, ( product(a10,a11,res10) )).
fof(p11, axiom, ( product(a11,a12,res11) )).
fof(p12, axiom, ( product(a12,a13,res12) )).
fof(goal, conjecture, ( ? [Z] : (product(a0,a1,Z)) )).
%------------------------------------------------------------------------------
