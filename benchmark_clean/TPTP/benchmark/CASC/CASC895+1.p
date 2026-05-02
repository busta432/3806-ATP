%------------------------------------------------------------------------------
% File     : CASC895+1
% Domain   : Competition (CASC-style)
% Problem  : implies_r chain 12
% Status   : Theorem
% Rating   : 0.36 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((implies_r(X,Y) & implies_r(Y,Z) => implies_r(X,Z))) )).
fof(e0, axiom, ( implies_r(x0,x1) )).
fof(e1, axiom, ( implies_r(x1,x2) )).
fof(e2, axiom, ( implies_r(x2,x3) )).
fof(e3, axiom, ( implies_r(x3,x4) )).
fof(e4, axiom, ( implies_r(x4,x5) )).
fof(e5, axiom, ( implies_r(x5,x6) )).
fof(e6, axiom, ( implies_r(x6,x7) )).
fof(e7, axiom, ( implies_r(x7,x8) )).
fof(e8, axiom, ( implies_r(x8,x9) )).
fof(e9, axiom, ( implies_r(x9,x10) )).
fof(e10, axiom, ( implies_r(x10,x11) )).
fof(e11, axiom, ( implies_r(x11,x12) )).
fof(goal, conjecture, ( implies_r(x0,x12) )).
%------------------------------------------------------------------------------
