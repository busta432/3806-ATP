%------------------------------------------------------------------------------
% File     : CASC832+1
% Domain   : Competition (CASC-style)
% Problem  : reaches chain 17
% Status   : Theorem
% Rating   : 0.51 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((reaches(X,Y) & reaches(Y,Z) => reaches(X,Z))) )).
fof(e0, axiom, ( reaches(x0,x1) )).
fof(e1, axiom, ( reaches(x1,x2) )).
fof(e2, axiom, ( reaches(x2,x3) )).
fof(e3, axiom, ( reaches(x3,x4) )).
fof(e4, axiom, ( reaches(x4,x5) )).
fof(e5, axiom, ( reaches(x5,x6) )).
fof(e6, axiom, ( reaches(x6,x7) )).
fof(e7, axiom, ( reaches(x7,x8) )).
fof(e8, axiom, ( reaches(x8,x9) )).
fof(e9, axiom, ( reaches(x9,x10) )).
fof(e10, axiom, ( reaches(x10,x11) )).
fof(e11, axiom, ( reaches(x11,x12) )).
fof(e12, axiom, ( reaches(x12,x13) )).
fof(e13, axiom, ( reaches(x13,x14) )).
fof(e14, axiom, ( reaches(x14,x15) )).
fof(e15, axiom, ( reaches(x15,x16) )).
fof(e16, axiom, ( reaches(x16,x17) )).
fof(goal, conjecture, ( reaches(x0,x17) )).
%------------------------------------------------------------------------------
