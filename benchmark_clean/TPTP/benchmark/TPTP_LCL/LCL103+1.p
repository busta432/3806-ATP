%------------------------------------------------------------------------------
% File     : LCL103+1
% Domain   : Logic Calculi
% Problem  : Implication chain depth 3
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p2(X) => p3(X))) )).
fof(base, axiom, ( ! [X] : (p0(X)) )).
fof(goal, conjecture, ( ! [X] : (p3(X)) )).
%------------------------------------------------------------------------------
