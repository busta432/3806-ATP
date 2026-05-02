%------------------------------------------------------------------------------
% File     : FOLIO292+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive chain 6 hops
% Status   : Theorem
% Rating   : 0.45 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(s1, axiom, ( ! [X] : ((trait0(X) => trait1(X))) )).
fof(s2, axiom, ( ! [X] : ((trait1(X) => trait2(X))) )).
fof(s3, axiom, ( ! [X] : ((trait2(X) => trait3(X))) )).
fof(s4, axiom, ( ! [X] : ((trait3(X) => trait4(X))) )).
fof(s5, axiom, ( ! [X] : ((trait4(X) => trait5(X))) )).
fof(s6, axiom, ( ! [X] : ((trait5(X) => trait6(X))) )).
fof(neg, axiom, ( ~trait6(entity1) )).
fof(goal, conjecture, ( ~trait0(entity1) )).
%------------------------------------------------------------------------------
