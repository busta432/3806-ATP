%------------------------------------------------------------------------------
% File     : LB_RES_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Resolution instance 8
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( theta(c7) | gamma(c7) )).
fof(p2, axiom, ( ~theta(c7) | r7(c7) )).
fof(goal, conjecture, ( gamma(c7) | r7(c7) )).
%------------------------------------------------------------------------------
