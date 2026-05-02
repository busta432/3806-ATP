%------------------------------------------------------------------------------
% File     : LB_ES_01
% Domain   : Inference Rules (LogicBench)
% Problem  : Existential Syllogism instance 1
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ? [X] : (alpha(X) & zeta(X)) )).
fof(p2, axiom, ( ! [X] : ((zeta(X) => result_0(X))) )).
fof(goal, conjecture, ( ? [X] : (result_0(X)) )).
%------------------------------------------------------------------------------
