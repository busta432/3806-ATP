%------------------------------------------------------------------------------
% File     : FOLIO079+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : bob has strong via brave
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((brave(X) => strong(X))) )).
fof(ax2, axiom, ( brave(bob) )).
fof(goal, conjecture, ( strong(bob) )).
%------------------------------------------------------------------------------
