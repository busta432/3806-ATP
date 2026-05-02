%------------------------------------------------------------------------------
% File     : LB_BI_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Introduction instance 4
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => iota(X))) )).
fof(p2, axiom, ( ! [X] : ((iota(X) => delta(X))) )).
fof(goal, conjecture, ( ! [X] : ((delta(X) <=> iota(X))) )).
%------------------------------------------------------------------------------
