%------------------------------------------------------------------------------
% File     : LB_EG_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Generalization instance 1
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( alpha(witness0) )).
fof(goal, conjecture, ( ? [X] : (alpha(X)) )).
%------------------------------------------------------------------------------
