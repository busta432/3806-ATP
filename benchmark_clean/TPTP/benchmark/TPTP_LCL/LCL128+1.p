%------------------------------------------------------------------------------
% File     : LCL128+1
% Domain   : Logic Calculi
% Problem  : Disjunctive elimination 8 disjuncts
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( ! [X] : (p0(X) | p1(X) | p2(X) | p3(X) | p4(X) | p5(X) | p6(X) | p7(X)) )).
fof(neg1, axiom, ( ! [X] : (~p0(X)) )).
fof(neg2, axiom, ( ! [X] : (~p1(X)) )).
fof(neg3, axiom, ( ! [X] : (~p2(X)) )).
fof(neg4, axiom, ( ! [X] : (~p3(X)) )).
fof(neg5, axiom, ( ! [X] : (~p4(X)) )).
fof(neg6, axiom, ( ! [X] : (~p5(X)) )).
fof(neg7, axiom, ( ! [X] : (~p6(X)) )).
fof(goal, conjecture, ( ! [X] : (p7(X)) )).
%------------------------------------------------------------------------------
