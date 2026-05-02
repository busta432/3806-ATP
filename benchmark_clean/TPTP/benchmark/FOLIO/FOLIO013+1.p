%------------------------------------------------------------------------------
% File     : FOLIO013+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every physicist is a academic
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((physicist(X) => scientist(X))) )).
fof(ax2, axiom, ( ! [X] : ((scientist(X) => academic(X))) )).
fof(ax3, axiom, ( physicist(person1) )).
fof(goal, conjecture, ( academic(person1) )).
%------------------------------------------------------------------------------
