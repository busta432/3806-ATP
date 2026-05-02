%------------------------------------------------------------------------------
% File     : FOLIO226+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Symmetric married_to
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sym, axiom, ( ! [X,Y] : ((married_to(X,Y) => married_to(Y,X))) )).
fof(fact, axiom, ( married_to(alice,bob) )).
fof(goal, conjecture, ( married_to(bob,alice) )).
%------------------------------------------------------------------------------
