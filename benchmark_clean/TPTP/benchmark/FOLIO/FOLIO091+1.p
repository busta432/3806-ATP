%------------------------------------------------------------------------------
% File     : FOLIO091+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : frank has careful via fast
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((fast(X) => careful(X))) )).
fof(ax2, axiom, ( fast(frank) )).
fof(goal, conjecture, ( careful(frank) )).
%------------------------------------------------------------------------------
