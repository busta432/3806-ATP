%------------------------------------------------------------------------------
% File     : LB_ES_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 3
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (gamma(X) & theta(X)) )).
fof(p2, axiom, ( ! [X] : ((theta(X) => result_2(X))) )).
fof(goal, conjecture, ( ? [X] : (result_2(X)) )).
%------------------------------------------------------------------------------
