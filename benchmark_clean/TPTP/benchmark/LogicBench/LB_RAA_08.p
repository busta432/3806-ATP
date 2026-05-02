%------------------------------------------------------------------------------
% File     : LB_RAA_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 8
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) => gamma(X))) )).
fof(p2, axiom, ( ! [X] : ((theta(X) => ~gamma(X))) )).
fof(goal, conjecture, ( ! [X] : (~theta(X)) )).
%------------------------------------------------------------------------------
