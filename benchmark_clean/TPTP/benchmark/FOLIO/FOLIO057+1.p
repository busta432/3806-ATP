%------------------------------------------------------------------------------
% File     : FOLIO057+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Relational: friend implies cooperates_with
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y] : ((friend(X,Y) => trusts(X,Y))) )).
fof(ax2, axiom, ( ! [X,Y] : ((trusts(X,Y) => cooperates_with(X,Y))) )).
fof(ax3, axiom, ( friend(alice,bob) )).
fof(goal, conjecture, ( cooperates_with(alice,bob) )).
%------------------------------------------------------------------------------
