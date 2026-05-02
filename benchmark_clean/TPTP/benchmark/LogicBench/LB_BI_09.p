%------------------------------------------------------------------------------
% File     : LB_BI_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 9
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => delta(X))) )).
fof(p2, axiom, ( ! [X] : ((delta(X) => iota(X))) )).
fof(goal, conjecture, ( ! [X] : ((iota(X) <=> delta(X))) )).
%------------------------------------------------------------------------------
