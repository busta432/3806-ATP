%------------------------------------------------------------------------------
% File     : LB_ES_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 9
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (iota(X) & delta(X)) )).
fof(p2, axiom, ( ! [X] : ((delta(X) => result_8(X))) )).
fof(goal, conjecture, ( ? [X] : (result_8(X)) )).
%------------------------------------------------------------------------------
