%------------------------------------------------------------------------------
% File     : CASC306+1
% Domain   : Competition (CASC-style)
% Problem  : Multi-axiom 6 steps with branches
% Status   : Theorem
% Rating   : 0.48 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p2(X) => p3(X))) )).
fof(ax4, axiom, ( ! [X] : ((p3(X) => p4(X))) )).
fof(ax5, axiom, ( ! [X] : ((p4(X) => p5(X))) )).
fof(ax6, axiom, ( ! [X] : ((p5(X) => p6(X))) )).
fof(br0, axiom, ( ! [X] : ((p0(X) => q0(X))) )).
fof(br2, axiom, ( ! [X] : ((p2(X) => q2(X))) )).
fof(br4, axiom, ( ! [X] : ((p4(X) => q4(X))) )).
fof(base, axiom, ( p0(c) )).
fof(goal, conjecture, ( p6(c) & q0(c) )).
%------------------------------------------------------------------------------
