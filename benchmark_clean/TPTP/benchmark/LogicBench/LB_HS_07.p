%------------------------------------------------------------------------------
% File     : LB_HS_07
% Domain   : Inference Rules (LogicBench)
% Problem  : Hypothetical Syllogism instance 7
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((eta(X) => mid6(X))) )).
fof(p2, axiom, ( ! [X] : ((mid6(X) => beta(X))) )).
fof(goal, conjecture, ( ! [X] : ((eta(X) => beta(X))) )).
%------------------------------------------------------------------------------
