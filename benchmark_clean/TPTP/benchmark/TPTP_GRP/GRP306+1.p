%------------------------------------------------------------------------------
% File     : GRP306+1
% Domain   : Group Theory
% Problem  : Group product chain 8 elements
% Status   : Theorem
% Rating   : 0.48 v1.0.0
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
fof(goal, conjecture, ( ? [Z] : (product(a0,a1,Z)) )).
%------------------------------------------------------------------------------
