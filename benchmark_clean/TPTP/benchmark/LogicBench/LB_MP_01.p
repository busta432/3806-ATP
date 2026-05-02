%------------------------------------------------------------------------------
% File     : LB_MP_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 1
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( alpha(c0) )).
fof(p2, axiom, ( ! [X] : ((alpha(X) => zeta(X))) )).
fof(goal, conjecture, ( zeta(c0) )).
%------------------------------------------------------------------------------
