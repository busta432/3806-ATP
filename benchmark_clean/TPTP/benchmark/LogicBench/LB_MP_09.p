%------------------------------------------------------------------------------
% File     : LB_MP_09
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 9
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( iota(c8) )).
fof(p2, axiom, ( ! [X] : ((iota(X) => delta(X))) )).
fof(goal, conjecture, ( delta(c8) )).
%------------------------------------------------------------------------------
