%------------------------------------------------------------------------------
% File     : FOLIO029+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In moscow implies in europe
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,moscow) => in_country(X,russia))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,russia) => in_continent(X,europe))) )).
fof(ax3, axiom, ( in_city(alice,moscow) )).
fof(goal, conjecture, ( in_continent(alice,europe) )).
%------------------------------------------------------------------------------
