%------------------------------------------------------------------------------
% File     : FOLIO066+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : eve has short via tall
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((tall(X) => short(X))) )).
fof(ax2, axiom, ( tall(eve) )).
fof(goal, conjecture, ( short(eve) )).
%------------------------------------------------------------------------------
