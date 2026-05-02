%------------------------------------------------------------------------------
% File     : FOLIO077+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : henry has kind via smart
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((smart(X) => kind(X))) )).
fof(ax2, axiom, ( smart(henry) )).
fof(goal, conjecture, ( kind(henry) )).
%------------------------------------------------------------------------------
