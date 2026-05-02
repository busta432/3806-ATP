%------------------------------------------------------------------------------
% File     : GRP317+1
% Domain   : Group Theory
% Problem  : Subgroup closure 6 generators
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
fof(sub_closed, axiom, ( ! [X,Y,Z] : ((subgrp(X) & subgrp(Y) & product(X,Y,Z) => subgrp(Z))) )).
fof(sub_inv, axiom, ( ! [X] : ((subgrp(X) => ? [Y] : (subgrp(Y) & product(X,Y,e)))) )).
fof(sub_e, axiom, ( subgrp(e) )).
fof(mem0, axiom, ( subgrp(s0) )).
fof(mem1, axiom, ( subgrp(s1) )).
fof(mem2, axiom, ( subgrp(s2) )).
fof(mem3, axiom, ( subgrp(s3) )).
fof(mem4, axiom, ( subgrp(s4) )).
fof(mem5, axiom, ( subgrp(s5) )).
fof(goal, conjecture, ( ? [Z] : (subgrp(Z) & product(s0,s1,Z)) )).
%------------------------------------------------------------------------------
