%------------------------------------------------------------------------------
% File     : LB_DS_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunctive Syllogism instance 10
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( kappa(c9) | epsilon(c9) )).
fof(p2, axiom, ( ~kappa(c9) )).
fof(goal, conjecture, ( epsilon(c9) )).
%------------------------------------------------------------------------------
