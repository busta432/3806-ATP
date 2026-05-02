%------------------------------------------------------------------------------
% File     : LB_ES_08
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 8
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (theta(X) & gamma(X)) )).
fof(p2, axiom, ( ! [X] : ((gamma(X) => result_7(X))) )).
fof(goal, conjecture, ( ? [X] : (result_7(X)) )).
%------------------------------------------------------------------------------
