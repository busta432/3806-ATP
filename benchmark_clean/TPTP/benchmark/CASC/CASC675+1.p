%------------------------------------------------------------------------------
% File     : CASC675+1
% Domain   : Competition (CASC-style)
% Problem  : Disjoint sets 9-way
% Status   : Theorem
% Rating   : 0.50 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(inter_def, axiom, ( ! [X,A,B] : ((member(X,inter(A,B)) <=> member(X,A) & member(X,B))) )).
fof(disj01, axiom, ( ! [X] : (~(member(X,s0) & member(X,s1))) )).
fof(disj02, axiom, ( ! [X] : (~(member(X,s0) & member(X,s2))) )).
fof(disj03, axiom, ( ! [X] : (~(member(X,s0) & member(X,s3))) )).
fof(disj04, axiom, ( ! [X] : (~(member(X,s0) & member(X,s4))) )).
fof(disj05, axiom, ( ! [X] : (~(member(X,s0) & member(X,s5))) )).
fof(disj06, axiom, ( ! [X] : (~(member(X,s0) & member(X,s6))) )).
fof(disj07, axiom, ( ! [X] : (~(member(X,s0) & member(X,s7))) )).
fof(disj08, axiom, ( ! [X] : (~(member(X,s0) & member(X,s8))) )).
fof(disj12, axiom, ( ! [X] : (~(member(X,s1) & member(X,s2))) )).
fof(disj13, axiom, ( ! [X] : (~(member(X,s1) & member(X,s3))) )).
fof(disj14, axiom, ( ! [X] : (~(member(X,s1) & member(X,s4))) )).
fof(disj15, axiom, ( ! [X] : (~(member(X,s1) & member(X,s5))) )).
fof(disj16, axiom, ( ! [X] : (~(member(X,s1) & member(X,s6))) )).
fof(disj17, axiom, ( ! [X] : (~(member(X,s1) & member(X,s7))) )).
fof(disj18, axiom, ( ! [X] : (~(member(X,s1) & member(X,s8))) )).
fof(disj23, axiom, ( ! [X] : (~(member(X,s2) & member(X,s3))) )).
fof(disj24, axiom, ( ! [X] : (~(member(X,s2) & member(X,s4))) )).
fof(disj25, axiom, ( ! [X] : (~(member(X,s2) & member(X,s5))) )).
fof(disj26, axiom, ( ! [X] : (~(member(X,s2) & member(X,s6))) )).
fof(disj27, axiom, ( ! [X] : (~(member(X,s2) & member(X,s7))) )).
fof(disj28, axiom, ( ! [X] : (~(member(X,s2) & member(X,s8))) )).
fof(disj34, axiom, ( ! [X] : (~(member(X,s3) & member(X,s4))) )).
fof(disj35, axiom, ( ! [X] : (~(member(X,s3) & member(X,s5))) )).
fof(disj36, axiom, ( ! [X] : (~(member(X,s3) & member(X,s6))) )).
fof(disj37, axiom, ( ! [X] : (~(member(X,s3) & member(X,s7))) )).
fof(disj38, axiom, ( ! [X] : (~(member(X,s3) & member(X,s8))) )).
fof(disj45, axiom, ( ! [X] : (~(member(X,s4) & member(X,s5))) )).
fof(disj46, axiom, ( ! [X] : (~(member(X,s4) & member(X,s6))) )).
fof(disj47, axiom, ( ! [X] : (~(member(X,s4) & member(X,s7))) )).
fof(disj48, axiom, ( ! [X] : (~(member(X,s4) & member(X,s8))) )).
fof(disj56, axiom, ( ! [X] : (~(member(X,s5) & member(X,s6))) )).
fof(disj57, axiom, ( ! [X] : (~(member(X,s5) & member(X,s7))) )).
fof(disj58, axiom, ( ! [X] : (~(member(X,s5) & member(X,s8))) )).
fof(disj67, axiom, ( ! [X] : (~(member(X,s6) & member(X,s7))) )).
fof(disj68, axiom, ( ! [X] : (~(member(X,s6) & member(X,s8))) )).
fof(disj78, axiom, ( ! [X] : (~(member(X,s7) & member(X,s8))) )).
fof(mem, axiom, ( member(elem,s0) )).
fof(goal, conjecture, ( ~member(elem,s1) )).
%------------------------------------------------------------------------------
