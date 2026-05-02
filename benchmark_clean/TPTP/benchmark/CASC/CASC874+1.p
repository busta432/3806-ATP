%------------------------------------------------------------------------------
% File     : CASC874+1
% Domain   : Competition (CASC-style)
% Problem  : covers chain 8
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((covers(X,Y) & covers(Y,Z) => covers(X,Z))) )).
fof(e0, axiom, ( covers(x0,x1) )).
fof(e1, axiom, ( covers(x1,x2) )).
fof(e2, axiom, ( covers(x2,x3) )).
fof(e3, axiom, ( covers(x3,x4) )).
fof(e4, axiom, ( covers(x4,x5) )).
fof(e5, axiom, ( covers(x5,x6) )).
fof(e6, axiom, ( covers(x6,x7) )).
fof(e7, axiom, ( covers(x7,x8) )).
fof(goal, conjecture, ( covers(x0,x8) )).
%------------------------------------------------------------------------------
