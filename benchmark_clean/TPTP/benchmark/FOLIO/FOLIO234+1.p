%------------------------------------------------------------------------------
% File     : FOLIO234+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 4 students all studies
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((student(X) => studies(X))) )).
fof(e0, axiom, ( student(alice) )).
fof(e1, axiom, ( student(bob) )).
fof(e2, axiom, ( student(charlie) )).
fof(e3, axiom, ( student(diana) )).
fof(goal, conjecture, ( studies(alice) & studies(bob) & studies(charlie) & studies(diana) )).
%------------------------------------------------------------------------------
