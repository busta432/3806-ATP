%------------------------------------------------------------------------------
% File     : FOLIO017+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every biologist is a academic
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((biologist(X) => scientist(X))) )).
fof(ax2, axiom, ( ! [X] : ((scientist(X) => academic(X))) )).
fof(ax3, axiom, ( biologist(person1) )).
fof(goal, conjecture, ( academic(person1) )).
%------------------------------------------------------------------------------
