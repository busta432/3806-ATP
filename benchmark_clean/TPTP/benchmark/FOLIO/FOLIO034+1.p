%------------------------------------------------------------------------------
% File     : FOLIO034+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not icy implies not snowing
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((snowing(X) => cold_ground(X))) )).
fof(ax2, axiom, ( ! [X] : ((cold_ground(X) => icy(X))) )).
fof(ax3, axiom, ( ~icy(today) )).
fof(goal, conjecture, ( ~snowing(today) )).
%------------------------------------------------------------------------------
