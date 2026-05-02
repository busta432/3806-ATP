%------------------------------------------------------------------------------
% File     : PUZ205+1
% Domain   : Puzzles
% Problem  : Pigeonhole 5 into 4
% Status   : Theorem
% Rating   : 0.60 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( in(p1,h1) | in(p1,h2) | in(p1,h3) | in(p1,h4) )).
fof(p2, axiom, ( in(p2,h1) | in(p2,h2) | in(p2,h3) | in(p2,h4) )).
fof(p3, axiom, ( in(p3,h1) | in(p3,h2) | in(p3,h3) | in(p3,h4) )).
fof(p4, axiom, ( in(p4,h1) | in(p4,h2) | in(p4,h3) | in(p4,h4) )).
fof(p5, axiom, ( in(p5,h1) | in(p5,h2) | in(p5,h3) | in(p5,h4) )).
fof(php, axiom, ( ! [H,X,Y] : ((in(X,H) & in(Y,H) & X != Y => shared(H))) )).
fof(goal, conjecture, ( ? [H] : (shared(H)) )).
%------------------------------------------------------------------------------
