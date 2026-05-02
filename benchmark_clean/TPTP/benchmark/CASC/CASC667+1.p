%------------------------------------------------------------------------------
% File     : CASC667+1
% Domain   : Competition (CASC-style)
% Problem  : Union associativity
% Status   : Theorem
% Rating   : 0.35 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(goal, conjecture, ( ! [X,A,B,C] : ((member(X,union(union(A,B),C)) <=> member(X,union(A,union(B,C))))) )).
%------------------------------------------------------------------------------
