%------------------------------------------------------------------------------
% File     : LB_DI_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunction Introduction instance 9
% Status   : Theorem
% Rating   : 0.02 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(c8) )).
fof(goal, conjecture, ( iota(c8) | delta(c8) )).
%------------------------------------------------------------------------------
