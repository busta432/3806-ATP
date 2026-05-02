%------------------------------------------------------------------------------
% File     : FOLIO010+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Not every professional is a teacher
% Status   : CounterSatisfiable
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((teacher(X) => educator(X))) )).
fof(ax2, axiom, ( ! [X] : ((educator(X) => professional(X))) )).
fof(ax3, axiom, ( professional(person1) )).
fof(goal, conjecture, ( teacher(person1) )).
%------------------------------------------------------------------------------
