%------------------------------------------------------------------------------
% File     : FOLIO289+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive chain 3 hops
% Status   : Theorem
% Rating   : 0.24 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((trait0(X) => trait1(X))) )).
fof(s2, axiom, ( ! [X] : ((trait1(X) => trait2(X))) )).
fof(s3, axiom, ( ! [X] : ((trait2(X) => trait3(X))) )).
fof(neg, axiom, ( ~trait3(entity1) )).
fof(goal, conjecture, ( ~trait0(entity1) )).
%------------------------------------------------------------------------------
