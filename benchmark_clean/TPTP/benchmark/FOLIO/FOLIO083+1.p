%------------------------------------------------------------------------------
% File     : FOLIO083+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : frank has strong via brave
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((brave(X) => strong(X))) )).
fof(ax2, axiom, ( brave(frank) )).
fof(goal, conjecture, ( strong(frank) )).
%------------------------------------------------------------------------------
