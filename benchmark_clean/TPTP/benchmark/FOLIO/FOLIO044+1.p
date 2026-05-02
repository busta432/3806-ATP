%------------------------------------------------------------------------------
% File     : FOLIO044+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not alert implies not sleeping
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((sleeping(X) => rested(X))) )).
fof(ax2, axiom, ( ! [X] : ((rested(X) => alert(X))) )).
fof(ax3, axiom, ( ~alert(today) )).
fof(goal, conjecture, ( ~sleeping(today) )).
%------------------------------------------------------------------------------
