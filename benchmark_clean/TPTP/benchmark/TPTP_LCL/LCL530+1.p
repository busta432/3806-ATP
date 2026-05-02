%------------------------------------------------------------------------------
% File     : LCL530+1
% Domain   : Logic Calculi
% Problem  : Symmetric transitive chain 3
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sym, axiom, ( ! [X,Y] : ((r(X,Y) => r(Y,X))) )).
fof(trans, axiom, ( ! [X,Y,Z] : ((r(X,Y) & r(Y,Z) => r(X,Z))) )).
fof(e0, axiom, ( r(b0,b1) )).
fof(e1, axiom, ( r(b1,b2) )).
fof(e2, axiom, ( r(b2,b3) )).
fof(goal, conjecture, ( r(b3,b0) )).
%------------------------------------------------------------------------------
