%------------------------------------------------------------------------------
% File     : FOLIO254+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 4 writers all writes
% Status   : Theorem
% Rating   : 0.12 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((writer(X) => writes(X))) )).
fof(e0, axiom, ( writer(alice) )).
fof(e1, axiom, ( writer(bob) )).
fof(e2, axiom, ( writer(charlie) )).
fof(e3, axiom, ( writer(diana) )).
fof(goal, conjecture, ( writes(alice) & writes(bob) & writes(charlie) & writes(diana) )).
%------------------------------------------------------------------------------
