%------------------------------------------------------------------------------
% File     : LB_DS_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunctive Syllogism instance 1
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( alpha(c0) | zeta(c0) )).
fof(p2, axiom, ( ~alpha(c0) )).
fof(goal, conjecture, ( zeta(c0) )).
%------------------------------------------------------------------------------
