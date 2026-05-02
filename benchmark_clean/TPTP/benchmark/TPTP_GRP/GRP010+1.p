%------------------------------------------------------------------------------
% File     : GRP010+1
% Domain   : Group Theory
% Problem  : Subgroup closure
% Status   : Theorem
% Rating   : 0.30 v1.0.0
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
fof(sub, axiom, ( ! [X] : ((subgroup(X) => group_member(X))) )).
fof(closed, axiom, ( ! [X,Y,Z] : ((subgroup(X) & subgroup(Y) & product(X,Y,Z) => subgroup(Z))) )).
fof(m1, axiom, ( subgroup(a) )).
fof(m2, axiom, ( subgroup(b) )).
fof(prod, axiom, ( product(a,b,c) )).
fof(goal, conjecture, ( subgroup(c) )).
%------------------------------------------------------------------------------
