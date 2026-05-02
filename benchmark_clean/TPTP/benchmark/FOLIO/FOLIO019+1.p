%------------------------------------------------------------------------------
% File     : FOLIO019+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every programmer is a professional
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((programmer(X) => technical_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((technical_professional(X) => professional(X))) )).
fof(ax3, axiom, ( programmer(person1) )).
fof(goal, conjecture, ( professional(person1) )).
%------------------------------------------------------------------------------
