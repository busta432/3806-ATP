%------------------------------------------------------------------------------
% File     : FOLIO051+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Disjunctive: one of eats_meat/eats_fish/eats_veg implies eats_food
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ax1, axiom, ( ! [X] : ((eats_meat(X) => eats_food(X))) )).
fof(ax2, axiom, ( ! [X] : ((eats_fish(X) => eats_food(X))) )).
fof(ax3, axiom, ( ! [X] : ((eats_veg(X) => eats_food(X))) )).
fof(ax4, axiom, ( eats_meat(person1) | eats_fish(person1) | eats_veg(person1) )).
fof(goal, conjecture, ( eats_food(person1) )).
%------------------------------------------------------------------------------
