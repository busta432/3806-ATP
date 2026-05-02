%------------------------------------------------------------------------------
% File     : LB_DNE_02
% Domain   : Inference Rules (LogicBench)
% Problem  : Double Negation Elimination instance 2
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ~~beta(c1) )).
fof(goal, conjecture, ( beta(c1) )).
%------------------------------------------------------------------------------
