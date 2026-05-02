%------------------------------------------------------------------------------
% File     : FOLIO016+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Not every academic is a chemist
% Status   : CounterSatisfiable
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((chemist(X) => scientist(X))) )).
fof(ax2, axiom, ( ! [X] : ((scientist(X) => academic(X))) )).
fof(ax3, axiom, ( academic(person1) )).
fof(goal, conjecture, ( chemist(person1) )).
%------------------------------------------------------------------------------
