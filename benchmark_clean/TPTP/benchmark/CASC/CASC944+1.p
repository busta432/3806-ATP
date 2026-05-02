%------------------------------------------------------------------------------
% File     : CASC944+1
% Domain   : Competition (CASC-style)
% Problem  : refines chain 10
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((refines(X,Y) & refines(Y,Z) => refines(X,Z))) )).
fof(e0, axiom, ( refines(x0,x1) )).
fof(e1, axiom, ( refines(x1,x2) )).
fof(e2, axiom, ( refines(x2,x3) )).
fof(e3, axiom, ( refines(x3,x4) )).
fof(e4, axiom, ( refines(x4,x5) )).
fof(e5, axiom, ( refines(x5,x6) )).
fof(e6, axiom, ( refines(x6,x7) )).
fof(e7, axiom, ( refines(x7,x8) )).
fof(e8, axiom, ( refines(x8,x9) )).
fof(e9, axiom, ( refines(x9,x10) )).
fof(goal, conjecture, ( refines(x0,x10) )).
%------------------------------------------------------------------------------
