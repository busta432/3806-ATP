%------------------------------------------------------------------------------
% File     : FOLIO045+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : eating_well implies energetic
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((eating_well(X) => nourished(X))) )).
fof(ax2, axiom, ( ! [X] : ((nourished(X) => energetic(X))) )).
fof(ax3, axiom, ( eating_well(today) )).
fof(goal, conjecture, ( energetic(today) )).
%------------------------------------------------------------------------------
