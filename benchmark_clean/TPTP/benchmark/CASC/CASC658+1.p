%------------------------------------------------------------------------------
% File     : CASC658+1
% Domain   : Competition (CASC-style)
% Problem  : Subset antisymmetry
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(a1, axiom, ( subset(s1,s2) )).
fof(a2, axiom, ( subset(s2,s1) )).
fof(goal, conjecture, ( ! [X] : ((member(X,s1) <=> member(X,s2))) )).
%------------------------------------------------------------------------------
