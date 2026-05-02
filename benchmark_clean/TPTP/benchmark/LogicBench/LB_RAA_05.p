%------------------------------------------------------------------------------
% File     : LB_RAA_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 5
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => kappa(X))) )).
fof(p2, axiom, ( ! [X] : ((epsilon(X) => ~kappa(X))) )).
fof(goal, conjecture, ( ! [X] : (~epsilon(X)) )).
%------------------------------------------------------------------------------
