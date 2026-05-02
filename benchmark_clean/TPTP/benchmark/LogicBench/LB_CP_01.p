%------------------------------------------------------------------------------
% File     : LB_CP_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 1
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => zeta(X))) )).
fof(goal, conjecture, ( ! [X] : ((~zeta(X) => ~alpha(X))) )).
%------------------------------------------------------------------------------
