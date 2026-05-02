%------------------------------------------------------------------------------
% File     : LCL308+1
% Domain   : Logic Calculi
% Problem  : Branching chain depth 4 branches 3
% Status   : Theorem
% Rating   : 0.21 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p2(X) => p3(X))) )).
fof(ax4, axiom, ( ! [X] : ((p3(X) => p4(X))) )).
fof(br0, axiom, ( ! [X] : ((p2(X) => q0(X))) )).
fof(br1, axiom, ( ! [X] : ((p2(X) => q1(X))) )).
fof(br2, axiom, ( ! [X] : ((p2(X) => q2(X))) )).
fof(base, axiom, ( p0(c) )).
fof(goal, conjecture, ( p4(c) & q0(c) & q1(c) & q2(c) )).
%------------------------------------------------------------------------------
