%------------------------------------------------------------------------------
% File     : CASC820+1
% Domain   : Competition (CASC-style)
% Problem  : reaches chain 5
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((reaches(X,Y) & reaches(Y,Z) => reaches(X,Z))) )).
fof(e0, axiom, ( reaches(x0,x1) )).
fof(e1, axiom, ( reaches(x1,x2) )).
fof(e2, axiom, ( reaches(x2,x3) )).
fof(e3, axiom, ( reaches(x3,x4) )).
fof(e4, axiom, ( reaches(x4,x5) )).
fof(goal, conjecture, ( reaches(x0,x5) )).
%------------------------------------------------------------------------------
