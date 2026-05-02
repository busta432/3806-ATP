%------------------------------------------------------------------------------
% File     : LB_MP_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 7
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( eta(c6) )).
fof(p2, axiom, ( ! [X] : ((eta(X) => beta(X))) )).
fof(goal, conjecture, ( beta(c6) )).
%------------------------------------------------------------------------------
