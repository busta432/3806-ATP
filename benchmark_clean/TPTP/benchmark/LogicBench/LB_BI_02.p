%------------------------------------------------------------------------------
% File     : LB_BI_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 2
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((beta(X) => eta(X))) )).
fof(p2, axiom, ( ! [X] : ((eta(X) => beta(X))) )).
fof(goal, conjecture, ( ! [X] : ((beta(X) <=> eta(X))) )).
%------------------------------------------------------------------------------
