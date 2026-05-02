%------------------------------------------------------------------------------
% File     : LCL504+1
% Domain   : Logic Calculi
% Problem  : Proof by contradiction depth 5
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s0, axiom, ( ! [X] : ((q0(X) => q1(X))) )).
fof(s1, axiom, ( ! [X] : ((q1(X) => q2(X))) )).
fof(s2, axiom, ( ! [X] : ((q2(X) => q3(X))) )).
fof(s3, axiom, ( ! [X] : ((q3(X) => q4(X))) )).
fof(s4, axiom, ( ! [X] : ((q4(X) => q5(X))) )).
fof(contra, axiom, ( ! [X] : ((q5(X) => ~q0(X))) )).
fof(goal, conjecture, ( ! [X] : (~q0(X)) )).
%------------------------------------------------------------------------------
