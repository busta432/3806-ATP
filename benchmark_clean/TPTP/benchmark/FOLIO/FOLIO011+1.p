%------------------------------------------------------------------------------
% File     : FOLIO011+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Every professor is a academic
% Status   : Theorem
% Rating   : 0.05 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((professor(X) => educator(X))) )).
fof(ax2, axiom, ( ! [X] : ((educator(X) => academic(X))) )).
fof(ax3, axiom, ( professor(person1) )).
fof(goal, conjecture, ( academic(person1) )).
%------------------------------------------------------------------------------
