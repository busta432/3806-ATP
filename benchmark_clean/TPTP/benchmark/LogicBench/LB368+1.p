%------------------------------------------------------------------------------
% File     : LB368+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 18
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( theta(obj17) | phi(obj17) )).
fof(p2, axiom, ( ~theta(obj17) )).
fof(p3, axiom, ( ! [X] : ((phi(X) => sigma(X))) )).
fof(goal, conjecture, ( sigma(obj17) )).
%------------------------------------------------------------------------------
