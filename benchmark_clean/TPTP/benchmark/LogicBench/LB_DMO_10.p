%------------------------------------------------------------------------------
% File     : LB_DMO_10
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 10
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(kappa(c9) | epsilon(c9)) )).
fof(goal, conjecture, ( ~kappa(c9) & ~epsilon(c9) )).
%------------------------------------------------------------------------------
