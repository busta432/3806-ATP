%------------------------------------------------------------------------------
% File     : LB_RAA_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Reductio ad Absurdum instance 6
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => alpha(X))) )).
fof(p2, axiom, ( ! [X] : ((zeta(X) => ~alpha(X))) )).
fof(goal, conjecture, ( ! [X] : (~zeta(X)) )).
%------------------------------------------------------------------------------
