%------------------------------------------------------------------------------
% File     : CASC601+1
% Domain   : Competition (CASC-style)
% Problem  : Redundant axiom chain 2 var 1
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : ((p0_0(X) => p1_0(X))) )).
fof(ax1, axiom, ( ! [X] : ((p1_0(X) => p2_0(X))) )).
fof(skip0, axiom, ( ! [X] : ((p0_0(X) => p2_0(X))) )).
fof(base, axiom, ( p0_0(c_0) )).
fof(goal, conjecture, ( p2_0(c_0) )).
%------------------------------------------------------------------------------
