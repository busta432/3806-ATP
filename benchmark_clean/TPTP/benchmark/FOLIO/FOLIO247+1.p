%------------------------------------------------------------------------------
% File     : FOLIO247+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 5 chefs all cooks
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((chef(X) => cooks(X))) )).
fof(e0, axiom, ( chef(alice) )).
fof(e1, axiom, ( chef(bob) )).
fof(e2, axiom, ( chef(charlie) )).
fof(e3, axiom, ( chef(diana) )).
fof(e4, axiom, ( chef(eve) )).
fof(goal, conjecture, ( cooks(alice) & cooks(bob) & cooks(charlie) & cooks(diana) & cooks(eve) )).
%------------------------------------------------------------------------------
