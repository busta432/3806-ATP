%------------------------------------------------------------------------------
% File     : LB_ES_06
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 6
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (zeta(X) & alpha(X)) )).
fof(p2, axiom, ( ! [X] : ((alpha(X) => result_5(X))) )).
fof(goal, conjecture, ( ? [X] : (result_5(X)) )).
%------------------------------------------------------------------------------
