%------------------------------------------------------------------------------
% File     : LB_MT_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Tollens instance 10
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((kappa(X) => epsilon(X))) )).
fof(p2, axiom, ( ~epsilon(c9) )).
fof(goal, conjecture, ( ~kappa(c9) )).
%------------------------------------------------------------------------------
