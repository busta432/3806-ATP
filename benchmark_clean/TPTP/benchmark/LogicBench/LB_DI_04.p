%------------------------------------------------------------------------------
% File     : LB_DI_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunction Introduction instance 4
% Status   : Theorem
% Rating   : 0.02 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( delta(c3) )).
fof(goal, conjecture, ( delta(c3) | iota(c3) )).
%------------------------------------------------------------------------------
