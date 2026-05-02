%------------------------------------------------------------------------------
% File     : LB_ES_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 4
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (delta(X) & iota(X)) )).
fof(p2, axiom, ( ! [X] : ((iota(X) => result_3(X))) )).
fof(goal, conjecture, ( ? [X] : (result_3(X)) )).
%------------------------------------------------------------------------------
