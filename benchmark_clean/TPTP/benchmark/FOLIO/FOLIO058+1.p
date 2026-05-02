%------------------------------------------------------------------------------
% File     : FOLIO058+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Relational: colleague implies collaborates_with
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y] : ((colleague(X,Y) => works_with(X,Y))) )).
fof(ax2, axiom, ( ! [X,Y] : ((works_with(X,Y) => collaborates_with(X,Y))) )).
fof(ax3, axiom, ( colleague(alice,bob) )).
fof(goal, conjecture, ( collaborates_with(alice,bob) )).
%------------------------------------------------------------------------------
