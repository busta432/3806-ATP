%------------------------------------------------------------------------------
% File     : CASC693+1
% Domain   : Competition (CASC-style)
% Problem  : member of union does not mean member of both
% Status   : CounterSatisfiable
% Rating   : 0.12 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(a1, axiom, ( member(e1,union(s1,s2)) )).
fof(goal, conjecture, ( member(e1,s1) & member(e1,s2) )).
%------------------------------------------------------------------------------
