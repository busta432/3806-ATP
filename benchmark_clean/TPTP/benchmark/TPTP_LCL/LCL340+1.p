%------------------------------------------------------------------------------
% File     : LCL340+1
% Domain   : Logic Calculi
% Problem  : Diamond pattern width 2
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(split, axiom, ( ! [X] : ((start(X) => l0(X) & r0(X))) )).
fof(ll0, axiom, ( ! [X] : ((l0(X) => l1(X))) )).
fof(rr0, axiom, ( ! [X] : ((r0(X) => r1(X))) )).
fof(merge, axiom, ( ! [X] : ((l1(X) & r1(X) => goal_p(X))) )).
fof(base, axiom, ( start(c) )).
fof(goal, conjecture, ( goal_p(c) )).
%------------------------------------------------------------------------------
