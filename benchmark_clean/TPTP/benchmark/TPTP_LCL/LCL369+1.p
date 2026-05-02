%------------------------------------------------------------------------------
% File     : LCL369+1
% Domain   : Logic Calculi
% Problem  : Negation elimination with 14 predicates
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p0_imp, axiom, ( ! [X] : ((p0(X) => q(X))) )).
fof(p1_imp, axiom, ( ! [X] : ((p1(X) => q(X))) )).
fof(p2_imp, axiom, ( ! [X] : ((p2(X) => q(X))) )).
fof(p3_imp, axiom, ( ! [X] : ((p3(X) => q(X))) )).
fof(p4_imp, axiom, ( ! [X] : ((p4(X) => q(X))) )).
fof(p5_imp, axiom, ( ! [X] : ((p5(X) => q(X))) )).
fof(p6_imp, axiom, ( ! [X] : ((p6(X) => q(X))) )).
fof(p7_imp, axiom, ( ! [X] : ((p7(X) => q(X))) )).
fof(p8_imp, axiom, ( ! [X] : ((p8(X) => q(X))) )).
fof(p9_imp, axiom, ( ! [X] : ((p9(X) => q(X))) )).
fof(p10_imp, axiom, ( ! [X] : ((p10(X) => q(X))) )).
fof(p11_imp, axiom, ( ! [X] : ((p11(X) => q(X))) )).
fof(p12_imp, axiom, ( ! [X] : ((p12(X) => q(X))) )).
fof(p13_imp, axiom, ( ! [X] : ((p13(X) => q(X))) )).
fof(neg0, axiom, ( ! [X] : (~p0(X)) )).
fof(neg1, axiom, ( ! [X] : (~p1(X)) )).
fof(neg2, axiom, ( ! [X] : (~p2(X)) )).
fof(neg3, axiom, ( ! [X] : (~p3(X)) )).
fof(neg4, axiom, ( ! [X] : (~p4(X)) )).
fof(neg5, axiom, ( ! [X] : (~p5(X)) )).
fof(neg6, axiom, ( ! [X] : (~p6(X)) )).
fof(neg7, axiom, ( ! [X] : (~p7(X)) )).
fof(neg8, axiom, ( ! [X] : (~p8(X)) )).
fof(neg9, axiom, ( ! [X] : (~p9(X)) )).
fof(neg10, axiom, ( ! [X] : (~p10(X)) )).
fof(neg11, axiom, ( ! [X] : (~p11(X)) )).
fof(neg12, axiom, ( ! [X] : (~p12(X)) )).
fof(negq, axiom, ( ~q(c) )).
fof(goal, conjecture, ( ~p13(c) )).
%------------------------------------------------------------------------------
