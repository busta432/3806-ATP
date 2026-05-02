%------------------------------------------------------------------------------
% File     : LB_DS_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunctive Syllogism instance 8
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( theta(c7) | gamma(c7) )).
fof(p2, axiom, ( ~theta(c7) )).
fof(goal, conjecture, ( gamma(c7) )).
%------------------------------------------------------------------------------
