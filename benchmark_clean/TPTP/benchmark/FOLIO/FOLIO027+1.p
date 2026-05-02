%------------------------------------------------------------------------------
% File     : FOLIO027+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In sydney implies in oceania
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,sydney) => in_country(X,australia))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,australia) => in_continent(X,oceania))) )).
fof(ax3, axiom, ( in_city(alice,sydney) )).
fof(goal, conjecture, ( in_continent(alice,oceania) )).
%------------------------------------------------------------------------------
