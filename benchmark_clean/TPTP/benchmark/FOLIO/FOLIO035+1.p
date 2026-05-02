%------------------------------------------------------------------------------
% File     : FOLIO035+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : studying implies confident
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((studying(X) => prepared(X))) )).
fof(ax2, axiom, ( ! [X] : ((prepared(X) => confident(X))) )).
fof(ax3, axiom, ( studying(today) )).
fof(goal, conjecture, ( confident(today) )).
%------------------------------------------------------------------------------
