%------------------------------------------------------------------------------
% File     : LB_RAA_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 10
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => epsilon(X))) )).
fof(p2, axiom, ( ! [X] : ((kappa(X) => ~epsilon(X))) )).
fof(goal, conjecture, ( ! [X] : (~kappa(X)) )).
%------------------------------------------------------------------------------
