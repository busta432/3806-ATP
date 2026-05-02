%------------------------------------------------------------------------------
% File     : CASC668+1
% Domain   : Competition (CASC-style)
% Problem  : Disjoint sets 2-way
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(inter_def, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(disj01, axiom, ( ! [X] : (~(member(X,s0) & member(X,s1))) )).
fof(mem, axiom, ( member(elem,s0) )).
fof(goal, conjecture, ( ~member(elem,s1) )).
%------------------------------------------------------------------------------
