%------------------------------------------------------------------------------
% File     : LCL200+1
% Domain   : Logic Calculi
% Problem  : Invalid: affirming consequent
% Status   : CounterSatisfiable
% Rating   : 0.05 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(goal, conjecture, ( ! [X] : (((p(X) => q(X)) & q(X) => p(X))) )).
%------------------------------------------------------------------------------
