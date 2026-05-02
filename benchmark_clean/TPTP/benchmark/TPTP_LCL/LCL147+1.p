%------------------------------------------------------------------------------
% File     : LCL147+1
% Domain   : Logic Calculi
% Problem  : Equivalence chain length 7
% Status   : Theorem
% Rating   : 0.42 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(eq1, axiom, ( ! [X] : ((p0(X) <=> p1(X))) )).
fof(eq2, axiom, ( ! [X] : ((p1(X) <=> p2(X))) )).
fof(eq3, axiom, ( ! [X] : ((p2(X) <=> p3(X))) )).
fof(eq4, axiom, ( ! [X] : ((p3(X) <=> p4(X))) )).
fof(eq5, axiom, ( ! [X] : ((p4(X) <=> p5(X))) )).
fof(eq6, axiom, ( ! [X] : ((p5(X) <=> p6(X))) )).
fof(goal, conjecture, ( ! [X] : ((p0(X) <=> p6(X))) )).
%------------------------------------------------------------------------------
