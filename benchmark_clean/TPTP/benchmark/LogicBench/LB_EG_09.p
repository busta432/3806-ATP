%------------------------------------------------------------------------------
% File     : LB_EG_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Generalization instance 9
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(witness8) )).
fof(goal, conjecture, ( ? [X] : (iota(X)) )).
%------------------------------------------------------------------------------
