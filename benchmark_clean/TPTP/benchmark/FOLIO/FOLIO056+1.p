%------------------------------------------------------------------------------
% File     : FOLIO056+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Penguin doesnt fly
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((penguin(X) => bird(X))) )).
fof(ax2, axiom, ( ! [X] : ((penguin(X) => ~flies(X))) )).
fof(ax3, axiom, ( penguin(tux) )).
fof(goal, conjecture, ( bird(tux) & ~flies(tux) )).
%------------------------------------------------------------------------------
