%------------------------------------------------------------------------------
% File     : CASC664+1
% Domain   : Competition (CASC-style)
% Problem  : Intersection with empty
% Status   : Theorem
% Rating   : 0.22 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(id, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(ed, axiom, ( ! [X] : (~member(X,empty)) )).
fof(goal, conjecture, ( ! [X,A] : (~member(X,inter(A,empty))) )).
%------------------------------------------------------------------------------
