%------------------------------------------------------------------------------
% File     : CASC_MIX001
% Domain   : Competition (CASC-style)
% Problem  : Well-ordering fragment
% Status   : Theorem
% Rating   : 0.60 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(wo, axiom, ( ! [S] : ((nonempty(S) => ? [M] : (member(M,S) & ! [X] : ((member(X,S) => leq(M,X)))))) )).
fof(a1, axiom, ( nonempty(s1) )).
fof(goal, conjecture, ( ? [M] : (member(M,s1) & ! [X] : ((member(X,s1) => leq(M,X)))) )).
%------------------------------------------------------------------------------
