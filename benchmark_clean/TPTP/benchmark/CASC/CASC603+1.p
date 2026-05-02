%------------------------------------------------------------------------------
% File     : CASC603+1
% Domain   : Competition (CASC-style)
% Problem  : Redundant axiom chain 2 var 3
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax0, axiom, ( ! [X] : ((p0_2(X) => p1_2(X))) )).
fof(ax1, axiom, ( ! [X] : ((p1_2(X) => p2_2(X))) )).
fof(skip0, axiom, ( ! [X] : ((p0_2(X) => p2_2(X))) )).
fof(base, axiom, ( p0_2(c_2) )).
fof(goal, conjecture, ( p2_2(c_2) )).
%------------------------------------------------------------------------------
