%------------------------------------------------------------------------------
% File     : CASC660+1
% Domain   : Competition (CASC-style)
% Problem  : Intersection idempotence
% Status   : Theorem
% Rating   : 0.25 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(id, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(goal, conjecture, ( ! [X,A] : ((member(X,inter(A,A)) <=> member(X,A))) )).
%------------------------------------------------------------------------------
