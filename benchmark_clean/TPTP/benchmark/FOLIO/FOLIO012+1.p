%------------------------------------------------------------------------------
% File     : FOLIO012+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Not every academic is a professor
% Status   : CounterSatisfiable
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((professor(X) => educator(X))) )).
fof(ax2, axiom, ( ! [X] : ((educator(X) => academic(X))) )).
fof(ax3, axiom, ( academic(person1) )).
fof(goal, conjecture, ( professor(person1) )).
%------------------------------------------------------------------------------
