%------------------------------------------------------------------------------
% File     : LB_RAA_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 9
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => delta(X))) )).
fof(p2, axiom, ( ! [X] : ((iota(X) => ~delta(X))) )).
fof(goal, conjecture, ( ! [X] : (~iota(X)) )).
%------------------------------------------------------------------------------
