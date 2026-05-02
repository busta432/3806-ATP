%------------------------------------------------------------------------------
% File     : FOLIO005+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every lawyer is a professional
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((lawyer(X) => legal_professional(X))) )).
fof(ax2, axiom, ( ! [X] : ((legal_professional(X) => professional(X))) )).
fof(ax3, axiom, ( lawyer(person1) )).
fof(goal, conjecture, ( professional(person1) )).
%------------------------------------------------------------------------------
