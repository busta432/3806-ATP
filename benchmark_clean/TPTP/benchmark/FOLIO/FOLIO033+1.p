%------------------------------------------------------------------------------
% File     : FOLIO033+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : snowing implies icy
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((snowing(X) => cold_ground(X))) )).
fof(ax2, axiom, ( ! [X] : ((cold_ground(X) => icy(X))) )).
fof(ax3, axiom, ( snowing(today) )).
fof(goal, conjecture, ( icy(today) )).
%------------------------------------------------------------------------------
