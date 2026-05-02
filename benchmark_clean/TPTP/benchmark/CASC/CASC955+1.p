%------------------------------------------------------------------------------
% File     : CASC955+1
% Domain   : Competition (CASC-style)
% Problem  : extends chain 4
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((extends(X,Y) & extends(Y,Z) => extends(X,Z))) )).
fof(e0, axiom, ( extends(x0,x1) )).
fof(e1, axiom, ( extends(x1,x2) )).
fof(e2, axiom, ( extends(x2,x3) )).
fof(e3, axiom, ( extends(x3,x4) )).
fof(goal, conjecture, ( extends(x0,x4) )).
%------------------------------------------------------------------------------
