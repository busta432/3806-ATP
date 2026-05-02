%------------------------------------------------------------------------------
% File     : FOLIO039+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : reading implies wise
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((reading(X) => knowledgeable(X))) )).
fof(ax2, axiom, ( ! [X] : ((knowledgeable(X) => wise(X))) )).
fof(ax3, axiom, ( reading(today) )).
fof(goal, conjecture, ( wise(today) )).
%------------------------------------------------------------------------------
