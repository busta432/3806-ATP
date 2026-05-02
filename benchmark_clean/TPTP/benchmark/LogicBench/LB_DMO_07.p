%------------------------------------------------------------------------------
% File     : LB_DMO_07
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 7
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(eta(c6) | beta(c6)) )).
fof(goal, conjecture, ( ~eta(c6) & ~beta(c6) )).
%------------------------------------------------------------------------------
