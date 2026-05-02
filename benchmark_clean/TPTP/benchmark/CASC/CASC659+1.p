%------------------------------------------------------------------------------
% File     : CASC659+1
% Domain   : Competition (CASC-style)
% Problem  : Union idempotence
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(goal, conjecture, ( ! [X,A] : ((member(X,union(A,A)) <=> member(X,A))) )).
%------------------------------------------------------------------------------
