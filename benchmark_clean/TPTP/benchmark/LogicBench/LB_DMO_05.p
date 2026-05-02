%------------------------------------------------------------------------------
% File     : LB_DMO_05
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 5
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(epsilon(c4) | kappa(c4)) )).
fof(goal, conjecture, ( ~epsilon(c4) & ~kappa(c4) )).
%------------------------------------------------------------------------------
