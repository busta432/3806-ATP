%------------------------------------------------------------------------------
% File     : PUZ208+1
% Domain   : Puzzles
% Problem  : Pigeonhole 8 into 7
% Status   : Theorem
% Rating   : 0.85 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( in(p1,h1) | in(p1,h2) | in(p1,h3) | in(p1,h4) | in(p1,h5) | in(p1,h6) | in(p1,h7) )).
fof(p2, axiom, ( in(p2,h1) | in(p2,h2) | in(p2,h3) | in(p2,h4) | in(p2,h5) | in(p2,h6) | in(p2,h7) )).
fof(p3, axiom, ( in(p3,h1) | in(p3,h2) | in(p3,h3) | in(p3,h4) | in(p3,h5) | in(p3,h6) | in(p3,h7) )).
fof(p4, axiom, ( in(p4,h1) | in(p4,h2) | in(p4,h3) | in(p4,h4) | in(p4,h5) | in(p4,h6) | in(p4,h7) )).
fof(p5, axiom, ( in(p5,h1) | in(p5,h2) | in(p5,h3) | in(p5,h4) | in(p5,h5) | in(p5,h6) | in(p5,h7) )).
fof(p6, axiom, ( in(p6,h1) | in(p6,h2) | in(p6,h3) | in(p6,h4) | in(p6,h5) | in(p6,h6) | in(p6,h7) )).
fof(p7, axiom, ( in(p7,h1) | in(p7,h2) | in(p7,h3) | in(p7,h4) | in(p7,h5) | in(p7,h6) | in(p7,h7) )).
fof(p8, axiom, ( in(p8,h1) | in(p8,h2) | in(p8,h3) | in(p8,h4) | in(p8,h5) | in(p8,h6) | in(p8,h7) )).
fof(php, axiom, ( ! [H,X,Y] : ((in(X,H) & in(Y,H) & X != Y => shared(H))) )).
fof(goal, conjecture, ( ? [H] : (shared(H)) )).
%------------------------------------------------------------------------------
