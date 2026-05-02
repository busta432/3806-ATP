%------------------------------------------------------------------------------
% File     : FOLIO288+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive chain 2 hops
% Status   : Theorem
% Rating   : 0.16 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((trait0(X) => trait1(X))) )).
fof(s2, axiom, ( ! [X] : ((trait1(X) => trait2(X))) )).
fof(neg, axiom, ( ~trait2(entity1) )).
fof(goal, conjecture, ( ~trait0(entity1) )).
%------------------------------------------------------------------------------
