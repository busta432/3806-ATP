%------------------------------------------------------------------------------
% File     : LB_DMO_02
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 2
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(beta(c1) | eta(c1)) )).
fof(goal, conjecture, ( ~beta(c1) & ~eta(c1) )).
%------------------------------------------------------------------------------
