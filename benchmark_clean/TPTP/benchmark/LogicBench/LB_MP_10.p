%------------------------------------------------------------------------------
% File     : LB_MP_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 10
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( kappa(c9) )).
fof(p2, axiom, ( ! [X] : ((kappa(X) => epsilon(X))) )).
fof(goal, conjecture, ( epsilon(c9) )).
%------------------------------------------------------------------------------
