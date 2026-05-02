%------------------------------------------------------------------------------
% File     : FOLIO232+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 2 students all studies
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((student(X) => studies(X))) )).
fof(e0, axiom, ( student(alice) )).
fof(e1, axiom, ( student(bob) )).
fof(goal, conjecture, ( studies(alice) & studies(bob) )).
%------------------------------------------------------------------------------
