%------------------------------------------------------------------------------
% File     : LCL360+1
% Domain   : Logic Calculi
% Problem  : Negation elimination with 5 predicates
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p0_imp, axiom, ( ! [X] : ((p0(X) => q(X))) )).
fof(p1_imp, axiom, ( ! [X] : ((p1(X) => q(X))) )).
fof(p2_imp, axiom, ( ! [X] : ((p2(X) => q(X))) )).
fof(p3_imp, axiom, ( ! [X] : ((p3(X) => q(X))) )).
fof(p4_imp, axiom, ( ! [X] : ((p4(X) => q(X))) )).
fof(neg0, axiom, ( ! [X] : (~p0(X)) )).
fof(neg1, axiom, ( ! [X] : (~p1(X)) )).
fof(neg2, axiom, ( ! [X] : (~p2(X)) )).
fof(neg3, axiom, ( ! [X] : (~p3(X)) )).
fof(negq, axiom, ( ~q(c) )).
fof(goal, conjecture, ( ~p4(c) )).
%------------------------------------------------------------------------------
