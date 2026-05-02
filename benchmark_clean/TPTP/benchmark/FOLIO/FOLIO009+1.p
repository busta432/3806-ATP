%------------------------------------------------------------------------------
% File     : FOLIO009+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every teacher is a professional
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((teacher(X) => educator(X))) )).
fof(ax2, axiom, ( ! [X] : ((educator(X) => professional(X))) )).
fof(ax3, axiom, ( teacher(person1) )).
fof(goal, conjecture, ( professional(person1) )).
%------------------------------------------------------------------------------
