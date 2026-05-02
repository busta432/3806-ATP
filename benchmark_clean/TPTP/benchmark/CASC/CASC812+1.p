%------------------------------------------------------------------------------
% File     : CASC812+1
% Domain   : Competition (CASC-style)
% Problem  : connects chain 14
% Status   : Theorem
% Rating   : 0.42 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((connects(X,Y) & connects(Y,Z) => connects(X,Z))) )).
fof(e0, axiom, ( connects(x0,x1) )).
fof(e1, axiom, ( connects(x1,x2) )).
fof(e2, axiom, ( connects(x2,x3) )).
fof(e3, axiom, ( connects(x3,x4) )).
fof(e4, axiom, ( connects(x4,x5) )).
fof(e5, axiom, ( connects(x5,x6) )).
fof(e6, axiom, ( connects(x6,x7) )).
fof(e7, axiom, ( connects(x7,x8) )).
fof(e8, axiom, ( connects(x8,x9) )).
fof(e9, axiom, ( connects(x9,x10) )).
fof(e10, axiom, ( connects(x10,x11) )).
fof(e11, axiom, ( connects(x11,x12) )).
fof(e12, axiom, ( connects(x12,x13) )).
fof(e13, axiom, ( connects(x13,x14) )).
fof(goal, conjecture, ( connects(x0,x14) )).
%------------------------------------------------------------------------------
