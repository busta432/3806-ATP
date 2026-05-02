%------------------------------------------------------------------------------
% File     : LB_MP_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 8
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( theta(c7) )).
fof(p2, axiom, ( ! [X] : ((theta(X) => gamma(X))) )).
fof(goal, conjecture, ( gamma(c7) )).
%------------------------------------------------------------------------------
