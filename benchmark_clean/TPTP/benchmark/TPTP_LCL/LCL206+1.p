%------------------------------------------------------------------------------
% File     : LCL206+1
% Domain   : Logic Calculi
% Problem  : Invalid: forall-or to or-forall
% Status   : CounterSatisfiable
% Rating   : 0.15 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(goal, conjecture, ( (! [X] : (p(X) | q(X)) => ! [X] : (p(X)) | ! [X] : (q(X))) )).
%------------------------------------------------------------------------------
