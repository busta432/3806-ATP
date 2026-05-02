%------------------------------------------------------------------------------
% File     : CASC694+1
% Domain   : Competition (CASC-style)
% Problem  : subsets does not mean nonempty intersection
% Status   : CounterSatisfiable
% Rating   : 0.25 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(id, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(a1, axiom, ( subset(s1,s3) )).
fof(a2, axiom, ( subset(s2,s3) )).
fof(goal, conjecture, ( ? [X] : (member(X,inter(s1,s2))) )).
%------------------------------------------------------------------------------
