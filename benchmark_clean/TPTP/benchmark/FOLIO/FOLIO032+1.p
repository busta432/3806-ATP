%------------------------------------------------------------------------------
% File     : FOLIO032+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not slippery implies not raining
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((raining(X) => wet_ground(X))) )).
fof(ax2, axiom, ( ! [X] : ((wet_ground(X) => slippery(X))) )).
fof(ax3, axiom, ( ~slippery(today) )).
fof(goal, conjecture, ( ~raining(today) )).
%------------------------------------------------------------------------------
