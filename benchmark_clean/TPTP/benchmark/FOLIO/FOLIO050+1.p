%------------------------------------------------------------------------------
% File     : FOLIO050+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Disjunctive: one of takes_bus/takes_train/takes_taxi implies uses_transport
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((takes_bus(X) => uses_transport(X))) )).
fof(ax2, axiom, ( ! [X] : ((takes_train(X) => uses_transport(X))) )).
fof(ax3, axiom, ( ! [X] : ((takes_taxi(X) => uses_transport(X))) )).
fof(ax4, axiom, ( takes_bus(person1) | takes_train(person1) | takes_taxi(person1) )).
fof(goal, conjecture, ( uses_transport(person1) )).
%------------------------------------------------------------------------------
