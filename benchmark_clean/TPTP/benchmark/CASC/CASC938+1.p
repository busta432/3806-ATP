%------------------------------------------------------------------------------
% File     : CASC938+1
% Domain   : Competition (CASC-style)
% Problem  : refines chain 4
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((refines(X,Y) & refines(Y,Z) => refines(X,Z))) )).
fof(e0, axiom, ( refines(x0,x1) )).
fof(e1, axiom, ( refines(x1,x2) )).
fof(e2, axiom, ( refines(x2,x3) )).
fof(e3, axiom, ( refines(x3,x4) )).
fof(goal, conjecture, ( refines(x0,x4) )).
%------------------------------------------------------------------------------
