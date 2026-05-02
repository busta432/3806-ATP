%------------------------------------------------------------------------------
% File     : FOLIO048+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Missing condition
% Status   : CounterSatisfiable
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((citizen(X) & adult(X) & registered(X) => can_vote(X))) )).
fof(ax2, axiom, ( citizen(bob) )).
fof(ax3, axiom, ( adult(bob) )).
fof(goal, conjecture, ( can_vote(bob) )).
%------------------------------------------------------------------------------
