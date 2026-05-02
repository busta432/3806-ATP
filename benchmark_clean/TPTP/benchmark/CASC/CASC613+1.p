%------------------------------------------------------------------------------
% File     : CASC613+1
% Domain   : Competition (CASC-style)
% Problem  : Redundant axiom chain 6 var 1
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : ((p0_0(X) => p1_0(X))) )).
fof(ax1, axiom, ( ! [X] : ((p1_0(X) => p2_0(X))) )).
fof(ax2, axiom, ( ! [X] : ((p2_0(X) => p3_0(X))) )).
fof(ax3, axiom, ( ! [X] : ((p3_0(X) => p4_0(X))) )).
fof(ax4, axiom, ( ! [X] : ((p4_0(X) => p5_0(X))) )).
fof(ax5, axiom, ( ! [X] : ((p5_0(X) => p6_0(X))) )).
fof(skip0, axiom, ( ! [X] : ((p0_0(X) => p2_0(X))) )).
fof(skip2, axiom, ( ! [X] : ((p2_0(X) => p4_0(X))) )).
fof(skip4, axiom, ( ! [X] : ((p4_0(X) => p6_0(X))) )).
fof(base, axiom, ( p0_0(c_0) )).
fof(goal, conjecture, ( p6_0(c_0) )).
%------------------------------------------------------------------------------
