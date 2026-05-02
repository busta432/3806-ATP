%------------------------------------------------------------------------------
% File     : FOLIO040+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not wise implies not reading
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((reading(X) => knowledgeable(X))) )).
fof(ax2, axiom, ( ! [X] : ((knowledgeable(X) => wise(X))) )).
fof(ax3, axiom, ( ~wise(today) )).
fof(goal, conjecture, ( ~reading(today) )).
%------------------------------------------------------------------------------
