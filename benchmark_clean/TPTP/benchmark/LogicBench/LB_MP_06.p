%------------------------------------------------------------------------------
% File     : LB_MP_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 6
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( zeta(c5) )).
fof(p2, axiom, ( ! [X] : ((zeta(X) => alpha(X))) )).
fof(goal, conjecture, ( alpha(c5) )).
%------------------------------------------------------------------------------
