%------------------------------------------------------------------------------
% File     : LB_BI_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 5
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => kappa(X))) )).
fof(p2, axiom, ( ! [X] : ((kappa(X) => epsilon(X))) )).
fof(goal, conjecture, ( ! [X] : ((epsilon(X) <=> kappa(X))) )).
%------------------------------------------------------------------------------
