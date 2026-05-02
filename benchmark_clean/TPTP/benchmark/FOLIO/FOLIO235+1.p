%------------------------------------------------------------------------------
% File     : FOLIO235+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 5 students all studies
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((student(X) => studies(X))) )).
fof(e0, axiom, ( student(alice) )).
fof(e1, axiom, ( student(bob) )).
fof(e2, axiom, ( student(charlie) )).
fof(e3, axiom, ( student(diana) )).
fof(e4, axiom, ( student(eve) )).
fof(goal, conjecture, ( studies(alice) & studies(bob) & studies(charlie) & studies(diana) & studies(eve) )).
%------------------------------------------------------------------------------
