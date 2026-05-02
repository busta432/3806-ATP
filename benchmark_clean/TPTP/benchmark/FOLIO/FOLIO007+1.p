%------------------------------------------------------------------------------
% File     : FOLIO007+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every engineer is a professional
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((engineer(X) => technical_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((technical_professional(X) => professional(X))) )).
fof(ax3, axiom, ( engineer(person1) )).
fof(goal, conjecture, ( professional(person1) )).
%------------------------------------------------------------------------------
