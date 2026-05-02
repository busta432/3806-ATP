%------------------------------------------------------------------------------
% File     : LCL502+1
% Domain   : Logic Calculi
% Problem  : Proof by contradiction depth 3
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s0, axiom, ( ! [X] : ((q0(X) => q1(X))) )).
fof(s1, axiom, ( ! [X] : ((q1(X) => q2(X))) )).
fof(s2, axiom, ( ! [X] : ((q2(X) => q3(X))) )).
fof(contra, axiom, ( ! [X] : ((q3(X) => ~q0(X))) )).
fof(goal, conjecture, ( ! [X] : (~q0(X)) )).
%------------------------------------------------------------------------------
