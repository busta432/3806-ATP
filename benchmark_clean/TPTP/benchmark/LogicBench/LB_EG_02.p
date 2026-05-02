%------------------------------------------------------------------------------
% File     : LB_EG_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Generalization instance 2
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( beta(witness1) )).
fof(goal, conjecture, ( ? [X] : (beta(X)) )).
%------------------------------------------------------------------------------
