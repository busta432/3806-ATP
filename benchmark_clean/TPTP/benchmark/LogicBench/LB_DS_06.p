%------------------------------------------------------------------------------
% File     : LB_DS_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Disjunctive Syllogism instance 6
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( zeta(c5) | alpha(c5) )).
fof(p2, axiom, ( ~zeta(c5) )).
fof(goal, conjecture, ( alpha(c5) )).
%------------------------------------------------------------------------------
