%------------------------------------------------------------------------------
% File     : LCL357+1
% Domain   : Logic Calculi
% Problem  : Diamond pattern width 19
% Status   : Theorem
% Rating   : 0.70 v1.0.0
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
fof(ll8, axiom, ( ! [X] : ((l8(X) => l9(X))) )).
fof(rr8, axiom, ( ! [X] : ((r8(X) => r9(X))) )).
fof(ll9, axiom, ( ! [X] : ((l9(X) => l10(X))) )).
fof(rr9, axiom, ( ! [X] : ((r9(X) => r10(X))) )).
fof(ll10, axiom, ( ! [X] : ((l10(X) => l11(X))) )).
fof(rr10, axiom, ( ! [X] : ((r10(X) => r11(X))) )).
fof(ll11, axiom, ( ! [X] : ((l11(X) => l12(X))) )).
fof(rr11, axiom, ( ! [X] : ((r11(X) => r12(X))) )).
fof(ll12, axiom, ( ! [X] : ((l12(X) => l13(X))) )).
fof(rr12, axiom, ( ! [X] : ((r12(X) => r13(X))) )).
fof(ll13, axiom, ( ! [X] : ((l13(X) => l14(X))) )).
fof(rr13, axiom, ( ! [X] : ((r13(X) => r14(X))) )).
fof(ll14, axiom, ( ! [X] : ((l14(X) => l15(X))) )).
fof(rr14, axiom, ( ! [X] : ((r14(X) => r15(X))) )).
fof(ll15, axiom, ( ! [X] : ((l15(X) => l16(X))) )).
fof(rr15, axiom, ( ! [X] : ((r15(X) => r16(X))) )).
fof(ll16, axiom, ( ! [X] : ((l16(X) => l17(X))) )).
fof(rr16, axiom, ( ! [X] : ((r16(X) => r17(X))) )).
fof(ll17, axiom, ( ! [X] : ((l17(X) => l18(X))) )).
fof(rr17, axiom, ( ! [X] : ((r17(X) => r18(X))) )).
fof(merge, axiom, ( ! [X] : ((l18(X) & r18(X) => goal_p(X))) )).
fof(base, axiom, ( start(c) )).
fof(goal, conjecture, ( goal_p(c) )).
%------------------------------------------------------------------------------
