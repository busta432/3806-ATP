%------------------------------------------------------------------------------
% File     : FOLIO046+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not energetic implies not eating_well
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((eating_well(X) => nourished(X))) )).
fof(ax2, axiom, ( ! [X] : ((nourished(X) => energetic(X))) )).
fof(ax3, axiom, ( ~energetic(today) )).
fof(goal, conjecture, ( ~eating_well(today) )).
%------------------------------------------------------------------------------
