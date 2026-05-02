%------------------------------------------------------------------------------
% File     : CASC869+1
% Domain   : Competition (CASC-style)
% Problem  : covers chain 3
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((covers(X,Y) & covers(Y,Z) => covers(X,Z))) )).
fof(e0, axiom, ( covers(x0,x1) )).
fof(e1, axiom, ( covers(x1,x2) )).
fof(e2, axiom, ( covers(x2,x3) )).
fof(goal, conjecture, ( covers(x0,x3) )).
%------------------------------------------------------------------------------
