%------------------------------------------------------------------------------
% File     : CASC663+1
% Domain   : Competition (CASC-style)
% Problem  : Union with empty set
% Status   : Theorem
% Rating   : 0.20 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ud, axiom, ( ! [X,A,B] : ((member(X,union(A,B)) <=> member(X,A) | member(X,B))) )).
fof(ed, axiom, ( ! [X] : (~member(X,empty)) )).
fof(goal, conjecture, ( ! [X,A] : ((member(X,union(A,empty)) <=> member(X,A))) )).
%------------------------------------------------------------------------------
