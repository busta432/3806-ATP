%------------------------------------------------------------------------------
% File     : CASC669+1
% Domain   : Competition (CASC-style)
% Problem  : Disjoint sets 3-way
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(inter_def, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(disj01, axiom, ( ! [X] : (~(member(X,s0) & member(X,s1))) )).
fof(disj02, axiom, ( ! [X] : (~(member(X,s0) & member(X,s2))) )).
fof(disj12, axiom, ( ! [X] : (~(member(X,s1) & member(X,s2))) )).
fof(mem, axiom, ( member(elem,s0) )).
fof(goal, conjecture, ( ~member(elem,s1) )).
%------------------------------------------------------------------------------
