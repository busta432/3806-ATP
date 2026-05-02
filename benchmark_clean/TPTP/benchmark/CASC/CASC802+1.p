%------------------------------------------------------------------------------
% File     : CASC802+1
% Domain   : Competition (CASC-style)
% Problem  : connects chain 4
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((connects(X,Y) & connects(Y,Z) => connects(X,Z))) )).
fof(e0, axiom, ( connects(x0,x1) )).
fof(e1, axiom, ( connects(x1,x2) )).
fof(e2, axiom, ( connects(x2,x3) )).
fof(e3, axiom, ( connects(x3,x4) )).
fof(goal, conjecture, ( connects(x0,x4) )).
%------------------------------------------------------------------------------
