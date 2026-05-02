%------------------------------------------------------------------------------
% File     : LCL620+1
% Domain   : Logic Calculi
% Problem  : Conjunction implies disjunction 3 vars
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(goal, conjecture, ( ! [X] : ((p0(X) & p1(X) & p2(X) => p0(X) | p1(X) | p2(X))) )).
%------------------------------------------------------------------------------
