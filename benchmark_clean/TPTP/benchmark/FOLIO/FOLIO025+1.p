%------------------------------------------------------------------------------
% File     : FOLIO025+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : In new_york implies in north_america
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((in_city(X,new_york) => in_country(X,usa))) )).
fof(ax2, axiom, ( ! [X] : ((in_country(X,usa) => in_continent(X,north_america))) )).
fof(ax3, axiom, ( in_city(alice,new_york) )).
fof(goal, conjecture, ( in_continent(alice,north_america) )).
%------------------------------------------------------------------------------
