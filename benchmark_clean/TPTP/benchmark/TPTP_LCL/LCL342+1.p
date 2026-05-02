%------------------------------------------------------------------------------
% File     : LCL342+1
% Domain   : Logic Calculi
% Problem  : Diamond pattern width 4
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(split, axiom, ( ! [X] : ((start(X) => l0(X) & r0(X))) )).
fof(ll0, axiom, ( ! [X] : ((l0(X) => l1(X))) )).
fof(rr0, axiom, ( ! [X] : ((r0(X) => r1(X))) )).
fof(ll1, axiom, ( ! [X] : ((l1(X) => l2(X))) )).
fof(rr1, axiom, ( ! [X] : ((r1(X) => r2(X))) )).
fof(ll2, axiom, ( ! [X] : ((l2(X) => l3(X))) )).
fof(rr2, axiom, ( ! [X] : ((r2(X) => r3(X))) )).
fof(merge, axiom, ( ! [X] : ((l3(X) & r3(X) => goal_p(X))) )).
fof(base, axiom, ( start(c) )).
fof(goal, conjecture, ( goal_p(c) )).
%------------------------------------------------------------------------------
