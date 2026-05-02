%------------------------------------------------------------------------------
% File     : LB_ES_05
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 5
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (epsilon(X) & kappa(X)) )).
fof(p2, axiom, ( ! [X] : ((kappa(X) => result_4(X))) )).
fof(goal, conjecture, ( ? [X] : (result_4(X)) )).
%------------------------------------------------------------------------------
