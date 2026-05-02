%------------------------------------------------------------------------------
% File     : LB_DI_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunction Introduction instance 2
% Status   : Theorem
% Rating   : 0.02 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( beta(c1) )).
fof(goal, conjecture, ( beta(c1) | eta(c1) )).
%------------------------------------------------------------------------------
