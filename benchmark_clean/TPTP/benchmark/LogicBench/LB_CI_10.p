%------------------------------------------------------------------------------
% File     : LB_CI_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Conjunction Introduction instance 10
% Status   : Theorem
% Rating   : 0.03 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( kappa(c9) )).
fof(p2, axiom, ( epsilon(c9) )).
fof(goal, conjecture, ( kappa(c9) & epsilon(c9) )).
%------------------------------------------------------------------------------
