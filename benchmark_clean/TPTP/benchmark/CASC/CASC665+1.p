%------------------------------------------------------------------------------
% File     : CASC665+1
% Domain   : Competition (CASC-style)
% Problem  : A subset of A union B
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(goal, conjecture, ( ! [A,B] : (subset(A,union(A,B))) )).
%------------------------------------------------------------------------------
