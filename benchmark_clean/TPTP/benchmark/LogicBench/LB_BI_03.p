%------------------------------------------------------------------------------
% File     : LB_BI_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 3
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => theta(X))) )).
fof(p2, axiom, ( ! [X] : ((theta(X) => gamma(X))) )).
fof(goal, conjecture, ( ! [X] : ((gamma(X) <=> theta(X))) )).
%------------------------------------------------------------------------------
