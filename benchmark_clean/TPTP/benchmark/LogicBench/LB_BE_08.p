%------------------------------------------------------------------------------
% File     : LB_BE_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 8
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((theta(X) <=> gamma(X))) )).
fof(p2, axiom, ( theta(c7) )).
fof(goal, conjecture, ( gamma(c7) )).
%------------------------------------------------------------------------------
