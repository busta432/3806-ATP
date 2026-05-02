%------------------------------------------------------------------------------
% File     : FOLIO080+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : charlie has strong via brave
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((brave(X) => strong(X))) )).
fof(ax2, axiom, ( brave(charlie) )).
fof(goal, conjecture, ( strong(charlie) )).
%------------------------------------------------------------------------------
