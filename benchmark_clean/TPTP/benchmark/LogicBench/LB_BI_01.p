%------------------------------------------------------------------------------
% File     : LB_BI_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 1
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) => zeta(X))) )).
fof(p2, axiom, ( ! [X] : ((zeta(X) => alpha(X))) )).
fof(goal, conjecture, ( ! [X] : ((alpha(X) <=> zeta(X))) )).
%------------------------------------------------------------------------------
