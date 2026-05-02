%------------------------------------------------------------------------------
% File     : LB_BE_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 6
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((zeta(X) <=> alpha(X))) )).
fof(p2, axiom, ( zeta(c5) )).
fof(goal, conjecture, ( alpha(c5) )).
%------------------------------------------------------------------------------
