%------------------------------------------------------------------------------
% File     : LB_BE_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Biconditional Elimination instance 3
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) <=> theta(X))) )).
fof(p2, axiom, ( gamma(c2) )).
fof(goal, conjecture, ( theta(c2) )).
%------------------------------------------------------------------------------
