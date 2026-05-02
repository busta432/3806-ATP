%------------------------------------------------------------------------------
% File     : LB_RAA_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 2
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => eta(X))) )).
fof(p2, axiom, ( ! [X] : ((beta(X) => ~eta(X))) )).
fof(goal, conjecture, ( ! [X] : (~beta(X)) )).
%------------------------------------------------------------------------------
