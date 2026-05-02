%------------------------------------------------------------------------------
% File     : FOLIO055+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Birds fly except penguins
% Status   : Theorem
% Rating   : 0.22 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((bird(X) & ~penguin(X) => flies(X))) )).
fof(ax2, axiom, ( ! [X] : ((penguin(X) => bird(X))) )).
fof(ax3, axiom, ( bird(robin) & ~penguin(robin) )).
fof(goal, conjecture, ( flies(robin) )).
%------------------------------------------------------------------------------
