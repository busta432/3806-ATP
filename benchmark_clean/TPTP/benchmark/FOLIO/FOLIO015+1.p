%------------------------------------------------------------------------------
% File     : FOLIO015+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every chemist is a academic
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((chemist(X) => scientist(X))) )).
fof(ax2, axiom, ( ! [X] : ((scientist(X) => academic(X))) )).
fof(ax3, axiom, ( chemist(person1) )).
fof(goal, conjecture, ( academic(person1) )).
%------------------------------------------------------------------------------
