%------------------------------------------------------------------------------
% File     : CASC_SET002
% Domain   : Competition (CASC-style)
% Problem  : Union membership
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(a1, axiom, ( member(e1,s1) )).
fof(goal, conjecture, ( member(e1,union(s1,s2)) )).
%------------------------------------------------------------------------------
