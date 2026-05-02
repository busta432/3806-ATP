%------------------------------------------------------------------------------
% File     : LCL512+1
% Domain   : Logic Calculi
% Problem  : Nested conditional depth 3
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax, axiom, ( ! [X] : ((((p(X) => v0(X)) => v1(X)) => v2(X))) )).
fof(holds, axiom, ( p(c) & v0(c) & v1(c) & v2(c) )).
fof(goal, conjecture, ( v2(c) )).
%------------------------------------------------------------------------------
