%------------------------------------------------------------------------------
% File     : LB_BE_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 4
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) <=> iota(X))) )).
fof(p2, axiom, ( delta(c3) )).
fof(goal, conjecture, ( iota(c3) )).
%------------------------------------------------------------------------------
