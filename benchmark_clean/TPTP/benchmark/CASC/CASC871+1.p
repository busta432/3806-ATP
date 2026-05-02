%------------------------------------------------------------------------------
% File     : CASC871+1
% Domain   : Competition (CASC-style)
% Problem  : covers chain 5
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((covers(X,Y) & covers(Y,Z) => covers(X,Z))) )).
fof(e0, axiom, ( covers(x0,x1) )).
fof(e1, axiom, ( covers(x1,x2) )).
fof(e2, axiom, ( covers(x2,x3) )).
fof(e3, axiom, ( covers(x3,x4) )).
fof(e4, axiom, ( covers(x4,x5) )).
fof(goal, conjecture, ( covers(x0,x5) )).
%------------------------------------------------------------------------------
