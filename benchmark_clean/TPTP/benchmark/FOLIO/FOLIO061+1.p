%------------------------------------------------------------------------------
% File     : FOLIO061+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Relational: mentor implies influences
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X,Y] : ((mentor(X,Y) => guides(X,Y))) )).
fof(ax2, axiom, ( ! [X,Y] : ((guides(X,Y) => influences(X,Y))) )).
fof(ax3, axiom, ( mentor(alice,bob) )).
fof(goal, conjecture, ( influences(alice,bob) )).
%------------------------------------------------------------------------------
