%------------------------------------------------------------------------------
% File     : LB_BI_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 6
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) => alpha(X))) )).
fof(p2, axiom, ( ! [X] : ((alpha(X) => zeta(X))) )).
fof(goal, conjecture, ( ! [X] : ((zeta(X) <=> alpha(X))) )).
%------------------------------------------------------------------------------
