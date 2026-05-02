%------------------------------------------------------------------------------
% File     : LB_EG_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Generalization instance 4
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( delta(witness3) )).
fof(goal, conjecture, ( ? [X] : (delta(X)) )).
%------------------------------------------------------------------------------
