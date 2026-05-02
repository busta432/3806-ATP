%------------------------------------------------------------------------------
% File     : FOLIO036+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Contrapositive: not confident implies not studying
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((studying(X) => prepared(X))) )).
fof(ax2, axiom, ( ! [X] : ((prepared(X) => confident(X))) )).
fof(ax3, axiom, ( ~confident(today) )).
fof(goal, conjecture, ( ~studying(today) )).
%------------------------------------------------------------------------------
