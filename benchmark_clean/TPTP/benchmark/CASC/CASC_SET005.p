%------------------------------------------------------------------------------
% File     : CASC_SET005
% Domain   : Competition (CASC-style)
% Problem  : Subset reflexivity
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sd, axiom, ( ! [A,B] : ((subset(A,B) <=> ! [X] : ((member(X,A) => member(X,B))))) )).
fof(goal, conjecture, ( ! [A] : (subset(A,A)) )).
%------------------------------------------------------------------------------
