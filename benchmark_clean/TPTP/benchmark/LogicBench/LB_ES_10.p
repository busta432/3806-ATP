%------------------------------------------------------------------------------
% File     : LB_ES_10
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 10
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (kappa(X) & epsilon(X)) )).
fof(p2, axiom, ( ! [X] : ((epsilon(X) => result_9(X))) )).
fof(goal, conjecture, ( ? [X] : (result_9(X)) )).
%------------------------------------------------------------------------------
