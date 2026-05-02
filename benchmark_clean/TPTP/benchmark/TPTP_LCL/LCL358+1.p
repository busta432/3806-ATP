%------------------------------------------------------------------------------
% File     : LCL358+1
% Domain   : Logic Calculi
% Problem  : Negation elimination with 3 predicates
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p0_imp, axiom, ( ! [X] : ((p0(X) => q(X))) )).
fof(p1_imp, axiom, ( ! [X] : ((p1(X) => q(X))) )).
fof(p2_imp, axiom, ( ! [X] : ((p2(X) => q(X))) )).
fof(neg0, axiom, ( ! [X] : (~p0(X)) )).
fof(neg1, axiom, ( ! [X] : (~p1(X)) )).
fof(negq, axiom, ( ~q(c) )).
fof(goal, conjecture, ( ~p2(c) )).
%------------------------------------------------------------------------------
