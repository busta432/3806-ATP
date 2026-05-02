%------------------------------------------------------------------------------
% File     : LB_HS_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 9
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((iota(X) => mid8(X))) )).
fof(p2, axiom, ( ! [X] : ((mid8(X) => delta(X))) )).
fof(goal, conjecture, ( ! [X] : ((iota(X) => delta(X))) )).
%------------------------------------------------------------------------------
