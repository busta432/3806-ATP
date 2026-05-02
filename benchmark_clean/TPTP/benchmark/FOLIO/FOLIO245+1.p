%------------------------------------------------------------------------------
% File     : FOLIO245+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 3 chefs all cooks
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((chef(X) => cooks(X))) )).
fof(e0, axiom, ( chef(alice) )).
fof(e1, axiom, ( chef(bob) )).
fof(e2, axiom, ( chef(charlie) )).
fof(goal, conjecture, ( cooks(alice) & cooks(bob) & cooks(charlie) )).
%------------------------------------------------------------------------------
