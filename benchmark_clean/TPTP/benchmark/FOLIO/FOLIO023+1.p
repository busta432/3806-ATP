%------------------------------------------------------------------------------
% File     : FOLIO023+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In tokyo implies in asia
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,tokyo) => in_country(X,japan))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,japan) => in_continent(X,asia))) )).
fof(ax3, axiom, ( in_city(alice,tokyo) )).
fof(goal, conjecture, ( in_continent(alice,asia) )).
%------------------------------------------------------------------------------
