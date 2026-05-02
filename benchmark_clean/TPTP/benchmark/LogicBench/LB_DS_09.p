%------------------------------------------------------------------------------
% File     : LB_DS_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunctive Syllogism instance 9
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(c8) | delta(c8) )).
fof(p2, axiom, ( ~iota(c8) )).
fof(goal, conjecture, ( delta(c8) )).
%------------------------------------------------------------------------------
