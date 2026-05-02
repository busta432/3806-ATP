%------------------------------------------------------------------------------
% File     : CASC609+1
% Domain   : Competition (CASC-style)
% Problem  : Redundant axiom chain 4 var 3
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : ((p0_2(X) => p1_2(X))) )).
fof(ax1, axiom, ( ! [X] : ((p1_2(X) => p2_2(X))) )).
fof(ax2, axiom, ( ! [X] : ((p2_2(X) => p3_2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p3_2(X) => p4_2(X))) )).
fof(skip0, axiom, ( ! [X] : ((p0_2(X) => p2_2(X))) )).
fof(skip2, axiom, ( ! [X] : ((p2_2(X) => p4_2(X))) )).
fof(base, axiom, ( p0_2(c_2) )).
fof(goal, conjecture, ( p4_2(c_2) )).
%------------------------------------------------------------------------------
