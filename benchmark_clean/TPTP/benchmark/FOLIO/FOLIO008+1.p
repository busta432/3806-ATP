%------------------------------------------------------------------------------
% File     : FOLIO008+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Not every professional is a engineer
% Status   : CounterSatisfiable
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((engineer(X) => technical_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((technical_professional(X) => professional(X))) )).
fof(ax3, axiom, ( professional(person1) )).
fof(goal, conjecture, ( engineer(person1) )).
%------------------------------------------------------------------------------
