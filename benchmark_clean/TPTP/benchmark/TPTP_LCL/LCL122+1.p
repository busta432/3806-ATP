%------------------------------------------------------------------------------
% File     : LCL122+1
% Domain   : Logic Calculi
% Problem  : Disjunctive elimination 2 disjuncts
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(disj, axiom, ( ! [X] : (p0(X) | p1(X)) )).
fof(neg1, axiom, ( ! [X] : (~p0(X)) )).
fof(goal, conjecture, ( ! [X] : (p1(X)) )).
%------------------------------------------------------------------------------
