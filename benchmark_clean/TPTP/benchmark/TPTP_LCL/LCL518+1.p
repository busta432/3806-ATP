%------------------------------------------------------------------------------
% File     : LCL518+1
% Domain   : Logic Calculi
% Problem  : Nested conditional depth 9
% Status   : Theorem
% Rating   : 0.70 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax, axiom, ( ! [X] : ((((((((((p(X) => v0(X)) => v1(X)) => v2(X)) => v3(X)) => v4(X)) => v5(X)) => v6(X)) => v7(X)) => v8(X))) )).
fof(holds, axiom, ( p(c) & v0(c) & v1(c) & v2(c) & v3(c) & v4(c) & v5(c) & v6(c) & v7(c) & v8(c) )).
fof(goal, conjecture, ( v8(c) )).
%------------------------------------------------------------------------------
