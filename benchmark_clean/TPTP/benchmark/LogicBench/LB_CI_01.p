%------------------------------------------------------------------------------
% File     : LB_CI_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Conjunction Introduction instance 1
% Status   : Theorem
% Rating   : 0.03 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( alpha(c0) )).
fof(p2, axiom, ( zeta(c0) )).
fof(goal, conjecture, ( alpha(c0) & zeta(c0) )).
%------------------------------------------------------------------------------
