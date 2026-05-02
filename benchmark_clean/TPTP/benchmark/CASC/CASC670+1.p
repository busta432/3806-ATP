%------------------------------------------------------------------------------
% File     : CASC670+1
% Domain   : Competition (CASC-style)
% Problem  : Disjoint sets 4-way
% Status   : Theorem
% Rating   : 0.32 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(inter_def, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(disj01, axiom, ( ! [X] : (~(member(X,s0) & member(X,s1))) )).
fof(disj02, axiom, ( ! [X] : (~(member(X,s0) & member(X,s2))) )).
fof(disj03, axiom, ( ! [X] : (~(member(X,s0) & member(X,s3))) )).
fof(disj12, axiom, ( ! [X] : (~(member(X,s1) & member(X,s2))) )).
fof(disj13, axiom, ( ! [X] : (~(member(X,s1) & member(X,s3))) )).
fof(disj23, axiom, ( ! [X] : (~(member(X,s2) & member(X,s3))) )).
fof(mem, axiom, ( member(elem,s0) )).
fof(goal, conjecture, ( ~member(elem,s1) )).
%------------------------------------------------------------------------------
