%------------------------------------------------------------------------------
% File     : CASC961+1
% Domain   : Competition (CASC-style)
% Problem  : extends chain 10
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((extends(X,Y) & extends(Y,Z) => extends(X,Z))) )).
fof(e0, axiom, ( extends(x0,x1) )).
fof(e1, axiom, ( extends(x1,x2) )).
fof(e2, axiom, ( extends(x2,x3) )).
fof(e3, axiom, ( extends(x3,x4) )).
fof(e4, axiom, ( extends(x4,x5) )).
fof(e5, axiom, ( extends(x5,x6) )).
fof(e6, axiom, ( extends(x6,x7) )).
fof(e7, axiom, ( extends(x7,x8) )).
fof(e8, axiom, ( extends(x8,x9) )).
fof(e9, axiom, ( extends(x9,x10) )).
fof(goal, conjecture, ( extends(x0,x10) )).
%------------------------------------------------------------------------------
