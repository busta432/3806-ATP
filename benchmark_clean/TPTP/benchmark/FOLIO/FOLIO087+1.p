%------------------------------------------------------------------------------
% File     : FOLIO087+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : bob has careful via fast
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((fast(X) => careful(X))) )).
fof(ax2, axiom, ( fast(bob) )).
fof(goal, conjecture, ( careful(bob) )).
%------------------------------------------------------------------------------
