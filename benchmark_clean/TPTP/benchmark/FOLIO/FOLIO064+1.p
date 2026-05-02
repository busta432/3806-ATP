%------------------------------------------------------------------------------
% File     : FOLIO064+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : charlie has short via tall
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((tall(X) => short(X))) )).
fof(ax2, axiom, ( tall(charlie) )).
fof(goal, conjecture, ( short(charlie) )).
%------------------------------------------------------------------------------
