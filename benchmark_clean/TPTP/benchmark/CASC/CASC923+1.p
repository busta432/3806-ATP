%------------------------------------------------------------------------------
% File     : CASC923+1
% Domain   : Competition (CASC-style)
% Problem  : subsumes chain 6
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((subsumes(X,Y) & subsumes(Y,Z) => subsumes(X,Z))) )).
fof(e0, axiom, ( subsumes(x0,x1) )).
fof(e1, axiom, ( subsumes(x1,x2) )).
fof(e2, axiom, ( subsumes(x2,x3) )).
fof(e3, axiom, ( subsumes(x3,x4) )).
fof(e4, axiom, ( subsumes(x4,x5) )).
fof(e5, axiom, ( subsumes(x5,x6) )).
fof(goal, conjecture, ( subsumes(x0,x6) )).
%------------------------------------------------------------------------------
