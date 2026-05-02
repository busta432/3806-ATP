%------------------------------------------------------------------------------
% File     : CASC627+1
% Domain   : Competition (CASC-style)
% Problem  : Redundant axiom chain 10 var 3
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : ((p0_2(X) => p1_2(X))) )).
fof(ax1, axiom, ( ! [X] : ((p1_2(X) => p2_2(X))) )).
fof(ax2, axiom, ( ! [X] : ((p2_2(X) => p3_2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p3_2(X) => p4_2(X))) )).
fof(ax4, axiom, ( ! [X] : ((p4_2(X) => p5_2(X))) )).
fof(ax5, axiom, ( ! [X] : ((p5_2(X) => p6_2(X))) )).
fof(ax6, axiom, ( ! [X] : ((p6_2(X) => p7_2(X))) )).
fof(ax7, axiom, ( ! [X] : ((p7_2(X) => p8_2(X))) )).
fof(ax8, axiom, ( ! [X] : ((p8_2(X) => p9_2(X))) )).
fof(ax9, axiom, ( ! [X] : ((p9_2(X) => p10_2(X))) )).
fof(skip0, axiom, ( ! [X] : ((p0_2(X) => p2_2(X))) )).
fof(skip2, axiom, ( ! [X] : ((p2_2(X) => p4_2(X))) )).
fof(skip4, axiom, ( ! [X] : ((p4_2(X) => p6_2(X))) )).
fof(skip6, axiom, ( ! [X] : ((p6_2(X) => p8_2(X))) )).
fof(skip8, axiom, ( ! [X] : ((p8_2(X) => p10_2(X))) )).
fof(base, axiom, ( p0_2(c_2) )).
fof(goal, conjecture, ( p10_2(c_2) )).
%------------------------------------------------------------------------------
