%------------------------------------------------------------------------------
% File     : LB_DI_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunction Introduction instance 5
% Status   : Theorem
% Rating   : 0.02 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( epsilon(c4) )).
fof(goal, conjecture, ( epsilon(c4) | kappa(c4) )).
%------------------------------------------------------------------------------
