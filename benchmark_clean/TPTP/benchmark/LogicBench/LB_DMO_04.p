%------------------------------------------------------------------------------
% File     : LB_DMO_04
% Domain   : Inference Rules (LogicBench)
% Problem  : De Morgan disjunction instance 4
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~(delta(c3) | iota(c3)) )).
fof(goal, conjecture, ( ~delta(c3) & ~iota(c3) )).
%------------------------------------------------------------------------------
