%------------------------------------------------------------------------------
% File     : LCL331+1
% Domain   : Logic Calculi
% Problem  : Branching chain depth 12 branches 2
% Status   : Theorem
% Rating   : 0.42 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p2(X) => p3(X))) )).
fof(ax4, axiom, ( ! [X] : ((p3(X) => p4(X))) )).
fof(ax5, axiom, ( ! [X] : ((p4(X) => p5(X))) )).
fof(ax6, axiom, ( ! [X] : ((p5(X) => p6(X))) )).
fof(ax7, axiom, ( ! [X] : ((p6(X) => p7(X))) )).
fof(ax8, axiom, ( ! [X] : ((p7(X) => p8(X))) )).
fof(ax9, axiom, ( ! [X] : ((p8(X) => p9(X))) )).
fof(ax10, axiom, ( ! [X] : ((p9(X) => p10(X))) )).
fof(ax11, axiom, ( ! [X] : ((p10(X) => p11(X))) )).
fof(ax12, axiom, ( ! [X] : ((p11(X) => p12(X))) )).
fof(br0, axiom, ( ! [X] : ((p6(X) => q0(X))) )).
fof(br1, axiom, ( ! [X] : ((p6(X) => q1(X))) )).
fof(base, axiom, ( p0(c) )).
fof(goal, conjecture, ( p12(c) & q0(c) & q1(c) )).
%------------------------------------------------------------------------------
