%------------------------------------------------------------------------------
% File     : LB_CI_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Conjunction Introduction instance 5
% Status   : Theorem
% Rating   : 0.03 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( epsilon(c4) )).
fof(p2, axiom, ( kappa(c4) )).
fof(goal, conjecture, ( epsilon(c4) & kappa(c4) )).
%------------------------------------------------------------------------------
