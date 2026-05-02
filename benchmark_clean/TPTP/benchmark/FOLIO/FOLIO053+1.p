%------------------------------------------------------------------------------
% File     : FOLIO053+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Disjunctive: one of runs/swims/cycles implies exercises
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((runs(X) => exercises(X))) )).
fof(ax2, axiom, ( ! [X] : ((swims(X) => exercises(X))) )).
fof(ax3, axiom, ( ! [X] : ((cycles(X) => exercises(X))) )).
fof(ax4, axiom, ( runs(person1) | swims(person1) | cycles(person1) )).
fof(goal, conjecture, ( exercises(person1) )).
%------------------------------------------------------------------------------
