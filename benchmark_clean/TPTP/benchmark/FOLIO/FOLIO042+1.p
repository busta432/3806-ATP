%------------------------------------------------------------------------------
% File     : FOLIO042+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not proficient implies not practicing
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((practicing(X) => skilled(X))) )).
fof(ax2, axiom, ( ! [X] : ((skilled(X) => proficient(X))) )).
fof(ax3, axiom, ( ~proficient(today) )).
fof(goal, conjecture, ( ~practicing(today) )).
%------------------------------------------------------------------------------
