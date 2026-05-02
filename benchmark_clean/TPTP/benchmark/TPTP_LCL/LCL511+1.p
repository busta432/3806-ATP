%------------------------------------------------------------------------------
% File     : LCL511+1
% Domain   : Logic Calculi
% Problem  : Nested conditional depth 2
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax, axiom, ( ! [X] : (((p(X) => v0(X)) => v1(X))) )).
fof(holds, axiom, ( p(c) & v0(c) & v1(c) )).
fof(goal, conjecture, ( v1(c) )).
%------------------------------------------------------------------------------
