%------------------------------------------------------------------------------
% File     : CASC303+1
% Domain   : Competition (CASC-style)
% Problem  : Multi-axiom 3 steps with branches
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((p0(X) => p1(X))) )).
fof(ax2, axiom, ( ! [X] : ((p1(X) => p2(X))) )).
fof(ax3, axiom, ( ! [X] : ((p2(X) => p3(X))) )).
fof(br0, axiom, ( ! [X] : ((p0(X) => q0(X))) )).
fof(br2, axiom, ( ! [X] : ((p2(X) => q2(X))) )).
fof(base, axiom, ( p0(c) )).
fof(goal, conjecture, ( p3(c) & q0(c) )).
%------------------------------------------------------------------------------
