%------------------------------------------------------------------------------
% File     : LCL347+1
% Domain   : Logic Calculi
% Problem  : Diamond pattern width 9
% Status   : Theorem
% Rating   : 0.45 v1.0.0
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
fof(ll3, axiom, ( ! [X] : ((l3(X) => l4(X))) )).
fof(rr3, axiom, ( ! [X] : ((r3(X) => r4(X))) )).
fof(ll4, axiom, ( ! [X] : ((l4(X) => l5(X))) )).
fof(rr4, axiom, ( ! [X] : ((r4(X) => r5(X))) )).
fof(ll5, axiom, ( ! [X] : ((l5(X) => l6(X))) )).
fof(rr5, axiom, ( ! [X] : ((r5(X) => r6(X))) )).
fof(ll6, axiom, ( ! [X] : ((l6(X) => l7(X))) )).
fof(rr6, axiom, ( ! [X] : ((r6(X) => r7(X))) )).
fof(ll7, axiom, ( ! [X] : ((l7(X) => l8(X))) )).
fof(rr7, axiom, ( ! [X] : ((r7(X) => r8(X))) )).
fof(merge, axiom, ( ! [X] : ((l8(X) & r8(X) => goal_p(X))) )).
fof(base, axiom, ( start(c) )).
fof(goal, conjecture, ( goal_p(c) )).
%------------------------------------------------------------------------------
