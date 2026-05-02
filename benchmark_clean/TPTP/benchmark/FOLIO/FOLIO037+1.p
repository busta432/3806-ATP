%------------------------------------------------------------------------------
% File     : FOLIO037+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : exercising implies healthy
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((exercising(X) => fit(X))) )).
fof(ax2, axiom, ( ! [X] : ((fit(X) => healthy(X))) )).
fof(ax3, axiom, ( exercising(today) )).
fof(goal, conjecture, ( healthy(today) )).
%------------------------------------------------------------------------------
