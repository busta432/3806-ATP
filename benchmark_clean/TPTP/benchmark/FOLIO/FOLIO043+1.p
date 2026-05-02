%------------------------------------------------------------------------------
% File     : FOLIO043+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : sleeping implies alert
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((sleeping(X) => rested(X))) )).
fof(ax2, axiom, ( ! [X] : ((rested(X) => alert(X))) )).
fof(ax3, axiom, ( sleeping(today) )).
fof(goal, conjecture, ( alert(today) )).
%------------------------------------------------------------------------------
