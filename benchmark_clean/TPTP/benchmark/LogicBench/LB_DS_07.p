%------------------------------------------------------------------------------
% File     : LB_DS_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunctive Syllogism instance 7
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( eta(c6) | beta(c6) )).
fof(p2, axiom, ( ~eta(c6) )).
fof(goal, conjecture, ( beta(c6) )).
%------------------------------------------------------------------------------
