%------------------------------------------------------------------------------
% File     : LB_BE_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 1
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((alpha(X) <=> zeta(X))) )).
fof(p2, axiom, ( alpha(c0) )).
fof(goal, conjecture, ( zeta(c0) )).
%------------------------------------------------------------------------------
