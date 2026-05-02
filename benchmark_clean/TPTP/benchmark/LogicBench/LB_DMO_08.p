%------------------------------------------------------------------------------
% File     : LB_DMO_08
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 8
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(theta(c7) | gamma(c7)) )).
fof(goal, conjecture, ( ~theta(c7) & ~gamma(c7) )).
%------------------------------------------------------------------------------
