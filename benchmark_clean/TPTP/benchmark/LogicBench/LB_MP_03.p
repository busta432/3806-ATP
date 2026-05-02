%------------------------------------------------------------------------------
% File     : LB_MP_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 3
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( gamma(c2) )).
fof(p2, axiom, ( ! [X] : ((gamma(X) => theta(X))) )).
fof(goal, conjecture, ( theta(c2) )).
%------------------------------------------------------------------------------
