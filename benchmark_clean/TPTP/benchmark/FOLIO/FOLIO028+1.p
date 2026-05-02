%------------------------------------------------------------------------------
% File     : FOLIO028+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In cairo implies in africa
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,cairo) => in_country(X,egypt))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,egypt) => in_continent(X,africa))) )).
fof(ax3, axiom, ( in_city(alice,cairo) )).
fof(goal, conjecture, ( in_continent(alice,africa) )).
%------------------------------------------------------------------------------
