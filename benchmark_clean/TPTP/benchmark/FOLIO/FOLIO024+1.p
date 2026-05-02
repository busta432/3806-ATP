%------------------------------------------------------------------------------
% File     : FOLIO024+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In beijing implies in asia
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,beijing) => in_country(X,china))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,china) => in_continent(X,asia))) )).
fof(ax3, axiom, ( in_city(alice,beijing) )).
fof(goal, conjecture, ( in_continent(alice,asia) )).
%------------------------------------------------------------------------------
