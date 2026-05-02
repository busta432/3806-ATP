%------------------------------------------------------------------------------
% File     : FOLIO041+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : practicing implies proficient
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((practicing(X) => skilled(X))) )).
fof(ax2, axiom, ( ! [X] : ((skilled(X) => proficient(X))) )).
fof(ax3, axiom, ( practicing(today) )).
fof(goal, conjecture, ( proficient(today) )).
%------------------------------------------------------------------------------
