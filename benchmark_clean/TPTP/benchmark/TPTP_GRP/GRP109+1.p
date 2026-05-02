%------------------------------------------------------------------------------
% File     : GRP109+1
% Domain   : Group Theory
% Problem  : Inverse chain length 9
% Status   : Theorem
% Rating   : 0.55 v1.0.0
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
fof(p1, axiom, ( product(g0,inv_g0,e) )).
fof(p2, axiom, ( product(g1,inv_g1,e) )).
fof(p3, axiom, ( product(g2,inv_g2,e) )).
fof(p4, axiom, ( product(g3,inv_g3,e) )).
fof(p5, axiom, ( product(g4,inv_g4,e) )).
fof(p6, axiom, ( product(g5,inv_g5,e) )).
fof(p7, axiom, ( product(g6,inv_g6,e) )).
fof(p8, axiom, ( product(g7,inv_g7,e) )).
fof(p9, axiom, ( product(g8,inv_g8,e) )).
fof(goal, conjecture, ( ? [Z] : (product(g0,inv_g0,Z)) )).
%------------------------------------------------------------------------------
