%------------------------------------------------------------------------------
% File     : CASC824+1
% Domain   : Competition (CASC-style)
% Problem  : reaches chain 9
% Status   : Theorem
% Rating   : 0.27 v1.0.0
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
fof(goal, conjecture, ( reaches(x0,x9) )).
%------------------------------------------------------------------------------
