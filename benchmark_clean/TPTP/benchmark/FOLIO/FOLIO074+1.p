%------------------------------------------------------------------------------
% File     : FOLIO074+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : eve has kind via smart
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((smart(X) => kind(X))) )).
fof(ax2, axiom, ( smart(eve) )).
fof(goal, conjecture, ( kind(eve) )).
%------------------------------------------------------------------------------
