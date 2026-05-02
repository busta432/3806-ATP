%------------------------------------------------------------------------------
% File     : LB_DMO_06
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 6
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(zeta(c5) | alpha(c5)) )).
fof(goal, conjecture, ( ~zeta(c5) & ~alpha(c5) )).
%------------------------------------------------------------------------------
