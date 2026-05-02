%------------------------------------------------------------------------------
% File     : LB_ES_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 2
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (beta(X) & eta(X)) )).
fof(p2, axiom, ( ! [X] : ((eta(X) => result_1(X))) )).
fof(goal, conjecture, ( ? [X] : (result_1(X)) )).
%------------------------------------------------------------------------------
