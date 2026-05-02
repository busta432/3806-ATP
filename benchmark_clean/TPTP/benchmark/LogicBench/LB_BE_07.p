%------------------------------------------------------------------------------
% File     : LB_BE_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 7
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) <=> beta(X))) )).
fof(p2, axiom, ( eta(c6) )).
fof(goal, conjecture, ( beta(c6) )).
%------------------------------------------------------------------------------
