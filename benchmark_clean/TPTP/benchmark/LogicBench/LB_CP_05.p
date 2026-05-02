%------------------------------------------------------------------------------
% File     : LB_CP_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Contrapositive instance 5
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => kappa(X))) )).
fof(goal, conjecture, ( ! [X] : ((~kappa(X) => ~epsilon(X))) )).
%------------------------------------------------------------------------------
