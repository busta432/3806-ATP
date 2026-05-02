%------------------------------------------------------------------------------
% File     : LCL135+1
% Domain   : Logic Calculi
% Problem  : Case analysis 5 cases
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cases, axiom, ( ! [X] : (p0(X) | p1(X) | p2(X) | p3(X) | p4(X)) )).
fof(case1, axiom, ( ! [X] : ((p0(X) => q(X))) )).
fof(case2, axiom, ( ! [X] : ((p1(X) => q(X))) )).
fof(case3, axiom, ( ! [X] : ((p2(X) => q(X))) )).
fof(case4, axiom, ( ! [X] : ((p3(X) => q(X))) )).
fof(case5, axiom, ( ! [X] : ((p4(X) => q(X))) )).
fof(goal, conjecture, ( ! [X] : (q(X)) )).
%------------------------------------------------------------------------------
