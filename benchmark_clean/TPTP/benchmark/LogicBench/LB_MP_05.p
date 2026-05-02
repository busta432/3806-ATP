%------------------------------------------------------------------------------
% File     : LB_MP_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 5
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( epsilon(c4) )).
fof(p2, axiom, ( ! [X] : ((epsilon(X) => kappa(X))) )).
fof(goal, conjecture, ( kappa(c4) )).
%------------------------------------------------------------------------------
