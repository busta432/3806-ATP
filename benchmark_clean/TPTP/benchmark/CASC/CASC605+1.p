%------------------------------------------------------------------------------
% File     : CASC605+1
% Domain   : Competition (CASC-style)
% Problem  : Redundant axiom chain 3 var 2
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : ((p0_1(X) => p1_1(X))) )).
fof(ax1, axiom, ( ! [X] : ((p1_1(X) => p2_1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p2_1(X) => p3_1(X))) )).
fof(skip0, axiom, ( ! [X] : ((p0_1(X) => p2_1(X))) )).
fof(base, axiom, ( p0_1(c_1) )).
fof(goal, conjecture, ( p3_1(c_1) )).
%------------------------------------------------------------------------------
