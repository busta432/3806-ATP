%------------------------------------------------------------------------------
% File     : LB_MP_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 2
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( beta(c1) )).
fof(p2, axiom, ( ! [X] : ((beta(X) => eta(X))) )).
fof(goal, conjecture, ( eta(c1) )).
%------------------------------------------------------------------------------
