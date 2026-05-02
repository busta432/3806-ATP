%------------------------------------------------------------------------------
% File     : LB_RAA_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 1
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => zeta(X))) )).
fof(p2, axiom, ( ! [X] : ((alpha(X) => ~zeta(X))) )).
fof(goal, conjecture, ( ! [X] : (~alpha(X)) )).
%------------------------------------------------------------------------------
