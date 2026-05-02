%------------------------------------------------------------------------------
% File     : FOLIO049+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Some passed implies someone happy
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((passed(X) => happy(X))) )).
fof(ax2, axiom, ( ? [X] : (student(X) & passed(X)) )).
fof(goal, conjecture, ( ? [X] : (happy(X)) )).
%------------------------------------------------------------------------------
