%------------------------------------------------------------------------------
% File     : LB365+1
% Domain   : Inference Rules (LogicBench)
% Problem  : DS+MP combination instance 15
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( epsilon(obj14) | theta(obj14) )).
fof(p2, axiom, ( ~epsilon(obj14) )).
fof(p3, axiom, ( ! [X] : ((theta(X) => psi(X))) )).
fof(goal, conjecture, ( psi(obj14) )).
%------------------------------------------------------------------------------
