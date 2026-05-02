%------------------------------------------------------------------------------
% File     : LB_BE_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 5
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) <=> kappa(X))) )).
fof(p2, axiom, ( epsilon(c4) )).
fof(goal, conjecture, ( kappa(c4) )).
%------------------------------------------------------------------------------
