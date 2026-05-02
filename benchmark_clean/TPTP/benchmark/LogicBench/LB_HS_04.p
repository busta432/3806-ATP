%------------------------------------------------------------------------------
% File     : LB_HS_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 4
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((delta(X) => mid3(X))) )).
fof(p2, axiom, ( ! [X] : ((mid3(X) => iota(X))) )).
fof(goal, conjecture, ( ! [X] : ((delta(X) => iota(X))) )).
%------------------------------------------------------------------------------
