%------------------------------------------------------------------------------
% File     : LB_BI_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 10
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => epsilon(X))) )).
fof(p2, axiom, ( ! [X] : ((epsilon(X) => kappa(X))) )).
fof(goal, conjecture, ( ! [X] : ((kappa(X) <=> epsilon(X))) )).
%------------------------------------------------------------------------------
