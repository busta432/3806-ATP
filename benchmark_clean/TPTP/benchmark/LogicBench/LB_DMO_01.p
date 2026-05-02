%------------------------------------------------------------------------------
% File     : LB_DMO_01
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 1
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(alpha(c0) | zeta(c0)) )).
fof(goal, conjecture, ( ~alpha(c0) & ~zeta(c0) )).
%------------------------------------------------------------------------------
