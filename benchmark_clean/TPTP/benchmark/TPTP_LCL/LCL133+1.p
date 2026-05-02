%------------------------------------------------------------------------------
% File     : LCL133+1
% Domain   : Logic Calculi
% Problem  : Case analysis 3 cases
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cases, axiom, ( ! [X] : (p0(X) | p1(X) | p2(X)) )).
fof(case1, axiom, ( ! [X] : ((p0(X) => q(X))) )).
fof(case2, axiom, ( ! [X] : ((p1(X) => q(X))) )).
fof(case3, axiom, ( ! [X] : ((p2(X) => q(X))) )).
fof(goal, conjecture, ( ! [X] : (q(X)) )).
%------------------------------------------------------------------------------
