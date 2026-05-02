%------------------------------------------------------------------------------
% File     : LCL503+1
% Domain   : Logic Calculi
% Problem  : Proof by contradiction depth 4
% Status   : Theorem
% Rating   : 0.32 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s0, axiom, ( ! [X] : ((q0(X) => q1(X))) )).
fof(s1, axiom, ( ! [X] : ((q1(X) => q2(X))) )).
fof(s2, axiom, ( ! [X] : ((q2(X) => q3(X))) )).
fof(s3, axiom, ( ! [X] : ((q3(X) => q4(X))) )).
fof(contra, axiom, ( ! [X] : ((q4(X) => ~q0(X))) )).
fof(goal, conjecture, ( ! [X] : (~q0(X)) )).
%------------------------------------------------------------------------------
