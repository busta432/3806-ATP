%------------------------------------------------------------------------------
% File     : LB_RAA_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 3
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => theta(X))) )).
fof(p2, axiom, ( ! [X] : ((gamma(X) => ~theta(X))) )).
fof(goal, conjecture, ( ! [X] : (~gamma(X)) )).
%------------------------------------------------------------------------------
