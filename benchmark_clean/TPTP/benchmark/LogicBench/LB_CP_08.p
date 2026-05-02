%------------------------------------------------------------------------------
% File     : LB_CP_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 8
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) => gamma(X))) )).
fof(goal, conjecture, ( ! [X] : ((~gamma(X) => ~theta(X))) )).
%------------------------------------------------------------------------------
