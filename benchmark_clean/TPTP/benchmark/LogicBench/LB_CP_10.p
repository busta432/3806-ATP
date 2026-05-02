%------------------------------------------------------------------------------
% File     : LB_CP_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 10
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => epsilon(X))) )).
fof(goal, conjecture, ( ! [X] : ((~epsilon(X) => ~kappa(X))) )).
%------------------------------------------------------------------------------
