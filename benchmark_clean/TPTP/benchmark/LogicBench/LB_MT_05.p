%------------------------------------------------------------------------------
% File     : LB_MT_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 5
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((epsilon(X) => kappa(X))) )).
fof(p2, axiom, ( ~kappa(c4) )).
fof(goal, conjecture, ( ~epsilon(c4) )).
%------------------------------------------------------------------------------
