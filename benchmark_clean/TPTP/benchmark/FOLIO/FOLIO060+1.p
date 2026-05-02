%------------------------------------------------------------------------------
% File     : FOLIO060+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Relational: sibling implies family_of
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y] : ((sibling(X,Y) => related_to(X,Y))) )).
fof(ax2, axiom, ( ! [X,Y] : ((related_to(X,Y) => family_of(X,Y))) )).
fof(ax3, axiom, ( sibling(alice,bob) )).
fof(goal, conjecture, ( family_of(alice,bob) )).
%------------------------------------------------------------------------------
