%------------------------------------------------------------------------------
% File     : LCL529+1
% Domain   : Logic Calculi
% Problem  : Symmetric transitive chain 2
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sym, axiom, ( ! [X,Y] : ((r(X,Y) => r(Y,X))) )).
fof(trans, axiom, ( ! [X,Y,Z] : ((r(X,Y) & r(Y,Z) => r(X,Z))) )).
fof(e0, axiom, ( r(b0,b1) )).
fof(e1, axiom, ( r(b1,b2) )).
fof(goal, conjecture, ( r(b2,b0) )).
%------------------------------------------------------------------------------
