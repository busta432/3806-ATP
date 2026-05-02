%------------------------------------------------------------------------------
% File     : LB_EG_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Generalization instance 5
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( epsilon(witness4) )).
fof(goal, conjecture, ( ? [X] : (epsilon(X)) )).
%------------------------------------------------------------------------------
