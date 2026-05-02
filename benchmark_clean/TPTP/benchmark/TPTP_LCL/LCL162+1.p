%------------------------------------------------------------------------------
% File     : LCL162+1
% Domain   : Logic Calculi
% Problem  : Contrapositive chain depth 2
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(neg, axiom, ( ! [X] : (~p2(X)) )).
fof(goal, conjecture, ( ! [X] : (~p0(X)) )).
%------------------------------------------------------------------------------
