%------------------------------------------------------------------------------
% File     : FOLIO244+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 2 chefs all cooks
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((chef(X) => cooks(X))) )).
fof(e0, axiom, ( chef(alice) )).
fof(e1, axiom, ( chef(bob) )).
fof(goal, conjecture, ( cooks(alice) & cooks(bob) )).
%------------------------------------------------------------------------------
