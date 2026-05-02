%------------------------------------------------------------------------------
% File     : CASC934+1
% Domain   : Competition (CASC-style)
% Problem  : subsumes chain 17
% Status   : Theorem
% Rating   : 0.51 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((subsumes(X,Y) & subsumes(Y,Z) => subsumes(X,Z))) )).
fof(e0, axiom, ( subsumes(x0,x1) )).
fof(e1, axiom, ( subsumes(x1,x2) )).
fof(e2, axiom, ( subsumes(x2,x3) )).
fof(e3, axiom, ( subsumes(x3,x4) )).
fof(e4, axiom, ( subsumes(x4,x5) )).
fof(e5, axiom, ( subsumes(x5,x6) )).
fof(e6, axiom, ( subsumes(x6,x7) )).
fof(e7, axiom, ( subsumes(x7,x8) )).
fof(e8, axiom, ( subsumes(x8,x9) )).
fof(e9, axiom, ( subsumes(x9,x10) )).
fof(e10, axiom, ( subsumes(x10,x11) )).
fof(e11, axiom, ( subsumes(x11,x12) )).
fof(e12, axiom, ( subsumes(x12,x13) )).
fof(e13, axiom, ( subsumes(x13,x14) )).
fof(e14, axiom, ( subsumes(x14,x15) )).
fof(e15, axiom, ( subsumes(x15,x16) )).
fof(e16, axiom, ( subsumes(x16,x17) )).
fof(goal, conjecture, ( subsumes(x0,x17) )).
%------------------------------------------------------------------------------
