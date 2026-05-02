%------------------------------------------------------------------------------
% File     : FOLIO021+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In paris implies in europe
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,paris) => in_country(X,france))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,france) => in_continent(X,europe))) )).
fof(ax3, axiom, ( in_city(alice,paris) )).
fof(goal, conjecture, ( in_continent(alice,europe) )).
%------------------------------------------------------------------------------
