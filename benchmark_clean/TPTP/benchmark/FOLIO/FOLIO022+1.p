%------------------------------------------------------------------------------
% File     : FOLIO022+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In berlin implies in europe
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,berlin) => in_country(X,germany))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,germany) => in_continent(X,europe))) )).
fof(ax3, axiom, ( in_city(alice,berlin) )).
fof(goal, conjecture, ( in_continent(alice,europe) )).
%------------------------------------------------------------------------------
