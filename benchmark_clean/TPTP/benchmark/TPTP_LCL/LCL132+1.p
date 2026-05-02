%------------------------------------------------------------------------------
% File     : LCL132+1
% Domain   : Logic Calculi
% Problem  : Case analysis 2 cases
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cases, axiom, ( ! [X] : (p0(X) | p1(X)) )).
fof(case1, axiom, ( ! [X] : ((p0(X) => q(X))) )).
fof(case2, axiom, ( ! [X] : ((p1(X) => q(X))) )).
fof(goal, conjecture, ( ! [X] : (q(X)) )).
%------------------------------------------------------------------------------
