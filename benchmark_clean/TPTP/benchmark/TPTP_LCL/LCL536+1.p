%------------------------------------------------------------------------------
% File     : LCL536+1
% Domain   : Logic Calculi
% Problem  : Symmetric transitive chain 9
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sym, axiom, ( ! [X,Y] : ((r(X,Y) => r(Y,X))) )).
fof(trans, axiom, ( ! [X,Y,Z] : ((r(X,Y) & r(Y,Z) => r(X,Z))) )).
fof(e0, axiom, ( r(b0,b1) )).
fof(e1, axiom, ( r(b1,b2) )).
fof(e2, axiom, ( r(b2,b3) )).
fof(e3, axiom, ( r(b3,b4) )).
fof(e4, axiom, ( r(b4,b5) )).
fof(e5, axiom, ( r(b5,b6) )).
fof(e6, axiom, ( r(b6,b7) )).
fof(e7, axiom, ( r(b7,b8) )).
fof(e8, axiom, ( r(b8,b9) )).
fof(goal, conjecture, ( r(b9,b0) )).
%------------------------------------------------------------------------------
