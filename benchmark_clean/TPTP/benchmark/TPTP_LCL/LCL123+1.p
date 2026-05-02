%------------------------------------------------------------------------------
% File     : LCL123+1
% Domain   : Logic Calculi
% Problem  : Disjunctive elimination 3 disjuncts
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( ! [X] : (p0(X) | p1(X) | p2(X)) )).
fof(neg1, axiom, ( ! [X] : (~p0(X)) )).
fof(neg2, axiom, ( ! [X] : (~p1(X)) )).
fof(goal, conjecture, ( ! [X] : (p2(X)) )).
%------------------------------------------------------------------------------
