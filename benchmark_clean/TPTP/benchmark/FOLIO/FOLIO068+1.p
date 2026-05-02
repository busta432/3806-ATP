%------------------------------------------------------------------------------
% File     : FOLIO068+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : grace has short via tall
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((tall(X) => short(X))) )).
fof(ax2, axiom, ( tall(grace) )).
fof(goal, conjecture, ( short(grace) )).
%------------------------------------------------------------------------------
