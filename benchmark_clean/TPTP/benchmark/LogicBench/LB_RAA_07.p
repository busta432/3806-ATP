%------------------------------------------------------------------------------
% File     : LB_RAA_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 7
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => beta(X))) )).
fof(p2, axiom, ( ! [X] : ((eta(X) => ~beta(X))) )).
fof(goal, conjecture, ( ! [X] : (~eta(X)) )).
%------------------------------------------------------------------------------
