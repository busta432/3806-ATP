%------------------------------------------------------------------------------
% File     : FOLIO038+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not healthy implies not exercising
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((exercising(X) => fit(X))) )).
fof(ax2, axiom, ( ! [X] : ((fit(X) => healthy(X))) )).
fof(ax3, axiom, ( ~healthy(today) )).
fof(goal, conjecture, ( ~exercising(today) )).
%------------------------------------------------------------------------------
