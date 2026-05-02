%------------------------------------------------------------------------------
% File     : LCL106+1
% Domain   : Logic Calculi
% Problem  : Implication chain depth 6
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p2(X) => p3(X))) )).
fof(ax4, axiom, ( ! [X] : ((p3(X) => p4(X))) )).
fof(ax5, axiom, ( ! [X] : ((p4(X) => p5(X))) )).
fof(ax6, axiom, ( ! [X] : ((p5(X) => p6(X))) )).
fof(base, axiom, ( ! [X] : (p0(X)) )).
fof(goal, conjecture, ( ! [X] : (p6(X)) )).
%------------------------------------------------------------------------------
