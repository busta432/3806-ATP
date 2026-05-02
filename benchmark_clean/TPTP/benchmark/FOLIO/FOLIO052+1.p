%------------------------------------------------------------------------------
% File     : FOLIO052+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Disjunctive: one of plays_guitar/plays_piano/plays_drums implies plays_instrument
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((plays_guitar(X) => plays_instrument(X))) )).
fof(ax2, axiom, ( ! [X] : ((plays_piano(X) => plays_instrument(X))) )).
fof(ax3, axiom, ( ! [X] : ((plays_drums(X) => plays_instrument(X))) )).
fof(ax4, axiom, ( plays_guitar(person1) | plays_piano(person1) | plays_drums(person1) )).
fof(goal, conjecture, ( plays_instrument(person1) )).
%------------------------------------------------------------------------------
