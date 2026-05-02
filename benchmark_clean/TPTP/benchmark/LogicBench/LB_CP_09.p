%------------------------------------------------------------------------------
% File     : LB_CP_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 9
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => delta(X))) )).
fof(goal, conjecture, ( ! [X] : ((~delta(X) => ~iota(X))) )).
%------------------------------------------------------------------------------
