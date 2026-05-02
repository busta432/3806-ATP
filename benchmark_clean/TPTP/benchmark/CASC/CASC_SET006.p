%------------------------------------------------------------------------------
% File     : CASC_SET006
% Domain   : Competition (CASC-style)
% Problem  : De Morgan for sets
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(cd, axiom, ( ! [X,A] : ((member(X,complement(A)) <=> ~member(X,A))) )).
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(id, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(goal, conjecture, ( ! [X,A,B] : ((member(X,complement(union(A,B))) <=> member(X,inter(complement(A),complement(B))))) )).
%------------------------------------------------------------------------------
