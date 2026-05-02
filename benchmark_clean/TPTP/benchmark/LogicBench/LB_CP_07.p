%------------------------------------------------------------------------------
% File     : LB_CP_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 7
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => beta(X))) )).
fof(goal, conjecture, ( ! [X] : ((~beta(X) => ~eta(X))) )).
%------------------------------------------------------------------------------
