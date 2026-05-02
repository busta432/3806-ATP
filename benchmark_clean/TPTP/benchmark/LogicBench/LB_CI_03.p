%------------------------------------------------------------------------------
% File     : LB_CI_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Conjunction Introduction instance 3
% Status   : Theorem
% Rating   : 0.03 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( gamma(c2) )).
fof(p2, axiom, ( theta(c2) )).
fof(goal, conjecture, ( gamma(c2) & theta(c2) )).
%------------------------------------------------------------------------------
