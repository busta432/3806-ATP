%------------------------------------------------------------------------------
% File     : LB_RAA_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 4
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => iota(X))) )).
fof(p2, axiom, ( ! [X] : ((delta(X) => ~iota(X))) )).
fof(goal, conjecture, ( ! [X] : (~delta(X)) )).
%------------------------------------------------------------------------------
