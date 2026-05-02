%------------------------------------------------------------------------------
% File     : LCL501+1
% Domain   : Logic Calculi
% Problem  : Proof by contradiction depth 2
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [LCL]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s0, axiom, ( ! [X] : ((q0(X) => q1(X))) )).
fof(s1, axiom, ( ! [X] : ((q1(X) => q2(X))) )).
fof(contra, axiom, ( ! [X] : ((q2(X) => ~q0(X))) )).
fof(goal, conjecture, ( ! [X] : (~q0(X)) )).
%------------------------------------------------------------------------------
