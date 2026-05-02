%------------------------------------------------------------------------------
% File     : CASC937+1
% Domain   : Competition (CASC-style)
% Problem  : refines chain 3
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((refines(X,Y) & refines(Y,Z) => refines(X,Z))) )).
fof(e0, axiom, ( refines(x0,x1) )).
fof(e1, axiom, ( refines(x1,x2) )).
fof(e2, axiom, ( refines(x2,x3) )).
fof(goal, conjecture, ( refines(x0,x3) )).
%------------------------------------------------------------------------------
