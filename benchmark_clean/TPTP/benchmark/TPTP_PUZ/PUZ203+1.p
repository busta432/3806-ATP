%------------------------------------------------------------------------------
% File     : PUZ203+1
% Domain   : Puzzles
% Problem  : Pigeonhole 3 into 2
% Status   : Theorem
% Rating   : 0.36 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( in(p1,h1) | in(p1,h2) )).
fof(p2, axiom, ( in(p2,h1) | in(p2,h2) )).
fof(p3, axiom, ( in(p3,h1) | in(p3,h2) )).
fof(php, axiom, ( ! [H,X,Y] : ((in(X,H) & in(Y,H) & X != Y => shared(H))) )).
fof(goal, conjecture, ( ? [H] : (shared(H)) )).
%------------------------------------------------------------------------------
