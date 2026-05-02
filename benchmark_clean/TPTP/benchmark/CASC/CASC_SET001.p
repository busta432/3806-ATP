%------------------------------------------------------------------------------
% File     : CASC_SET001
% Domain   : Competition (CASC-style)
% Problem  : Subset transitivity
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(a1, axiom, ( subset(a,b) )).
fof(a2, axiom, ( subset(b,c) )).
fof(goal, conjecture, ( subset(a,c) )).
%------------------------------------------------------------------------------
