%------------------------------------------------------------------------------
% File     : FOLIO059+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Relational: neighbor implies helps
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y] : ((neighbor(X,Y) => knows(X,Y))) )).
fof(ax2, axiom, ( ! [X,Y] : ((knows(X,Y) => helps(X,Y))) )).
fof(ax3, axiom, ( neighbor(alice,bob) )).
fof(goal, conjecture, ( helps(alice,bob) )).
%------------------------------------------------------------------------------
