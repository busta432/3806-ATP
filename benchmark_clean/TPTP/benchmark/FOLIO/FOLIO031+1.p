%------------------------------------------------------------------------------
% File     : FOLIO031+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : raining implies slippery
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((raining(X) => wet_ground(X))) )).
fof(ax2, axiom, ( ! [X] : ((wet_ground(X) => slippery(X))) )).
fof(ax3, axiom, ( raining(today) )).
fof(goal, conjecture, ( slippery(today) )).
%------------------------------------------------------------------------------
