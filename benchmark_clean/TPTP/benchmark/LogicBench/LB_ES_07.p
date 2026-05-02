%------------------------------------------------------------------------------
% File     : LB_ES_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 7
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (eta(X) & beta(X)) )).
fof(p2, axiom, ( ! [X] : ((beta(X) => result_6(X))) )).
fof(goal, conjecture, ( ? [X] : (result_6(X)) )).
%------------------------------------------------------------------------------
