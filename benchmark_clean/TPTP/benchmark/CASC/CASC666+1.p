%------------------------------------------------------------------------------
% File     : CASC666+1
% Domain   : Competition (CASC-style)
% Problem  : A inter B subset of A
% Status   : Theorem
% Rating   : 0.30 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(id, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(goal, conjecture, ( ! [A,B] : (subset(inter(A,B),A)) )).
%------------------------------------------------------------------------------
