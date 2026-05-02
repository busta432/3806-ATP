%------------------------------------------------------------------------------
% File     : LB_BI_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 7
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => beta(X))) )).
fof(p2, axiom, ( ! [X] : ((beta(X) => eta(X))) )).
fof(goal, conjecture, ( ! [X] : ((eta(X) <=> beta(X))) )).
%------------------------------------------------------------------------------
