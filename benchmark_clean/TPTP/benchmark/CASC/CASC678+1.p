%------------------------------------------------------------------------------
% File     : CASC678+1
% Domain   : Competition (CASC-style)
% Problem  : Relational propagation depth 4
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(comp, axiom, ( ! [X,Y] : ((p(X) & q(X,Y) => p(Y))) )).
fof(q0, axiom, ( q(a0,a1) )).
fof(q1, axiom, ( q(a1,a2) )).
fof(q2, axiom, ( q(a2,a3) )).
fof(q3, axiom, ( q(a3,a4) )).
fof(base, axiom, ( p(a0) )).
fof(goal, conjecture, ( p(a4) )).
%------------------------------------------------------------------------------
