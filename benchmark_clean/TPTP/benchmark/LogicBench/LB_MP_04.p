%------------------------------------------------------------------------------
% File     : LB_MP_04
% Domain   : Inference Rules (LogicBench)
% Problem  : Modus Ponens instance 4
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( delta(c3) )).
fof(p2, axiom, ( ! [X] : ((delta(X) => iota(X))) )).
fof(goal, conjecture, ( iota(c3) )).
%------------------------------------------------------------------------------
