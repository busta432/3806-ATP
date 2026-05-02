%------------------------------------------------------------------------------
% File     : LB_EG_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Generalization instance 3
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( gamma(witness2) )).
fof(goal, conjecture, ( ? [X] : (gamma(X)) )).
%------------------------------------------------------------------------------
