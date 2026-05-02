%------------------------------------------------------------------------------
% File     : LB_BE_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 9
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) <=> delta(X))) )).
fof(p2, axiom, ( iota(c8) )).
fof(goal, conjecture, ( delta(c8) )).
%------------------------------------------------------------------------------
