%------------------------------------------------------------------------------
% File     : LB_CI_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Conjunction Introduction instance 9
% Status   : Theorem
% Rating   : 0.03 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(c8) )).
fof(p2, axiom, ( delta(c8) )).
fof(goal, conjecture, ( iota(c8) & delta(c8) )).
%------------------------------------------------------------------------------
