%------------------------------------------------------------------------------
% File     : LCL514+1
% Domain   : Logic Calculi
% Problem  : Nested conditional depth 5
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax, axiom, ( ! [X] : ((((((p(X) => v0(X)) => v1(X)) => v2(X)) => v3(X)) => v4(X))) )).
fof(holds, axiom, ( p(c) & v0(c) & v1(c) & v2(c) & v3(c) & v4(c) )).
fof(goal, conjecture, ( v4(c) )).
%------------------------------------------------------------------------------
