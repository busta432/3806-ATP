%------------------------------------------------------------------------------
% File     : CASC690+1
% Domain   : Competition (CASC-style)
% Problem  : Relational propagation depth 16
% Status   : Theorem
% Rating   : 0.64 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(comp, axiom, ( ! [X,Y] : ((p(X) & q(X,Y) => p(Y))) )).
fof(q0, axiom, ( q(a0,a1) )).
fof(q1, axiom, ( q(a1,a2) )).
fof(q2, axiom, ( q(a2,a3) )).
fof(q3, axiom, ( q(a3,a4) )).
fof(q4, axiom, ( q(a4,a5) )).
fof(q5, axiom, ( q(a5,a6) )).
fof(q6, axiom, ( q(a6,a7) )).
fof(q7, axiom, ( q(a7,a8) )).
fof(q8, axiom, ( q(a8,a9) )).
fof(q9, axiom, ( q(a9,a10) )).
fof(q10, axiom, ( q(a10,a11) )).
fof(q11, axiom, ( q(a11,a12) )).
fof(q12, axiom, ( q(a12,a13) )).
fof(q13, axiom, ( q(a13,a14) )).
fof(q14, axiom, ( q(a14,a15) )).
fof(q15, axiom, ( q(a15,a16) )).
fof(base, axiom, ( p(a0) )).
fof(goal, conjecture, ( p(a16) )).
%------------------------------------------------------------------------------
