%------------------------------------------------------------------------------
% File     : LB_CI_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Conjunction Introduction instance 7
% Status   : Theorem
% Rating   : 0.03 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( eta(c6) )).
fof(p2, axiom, ( beta(c6) )).
fof(goal, conjecture, ( eta(c6) & beta(c6) )).
%------------------------------------------------------------------------------
