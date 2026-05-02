%------------------------------------------------------------------------------
% File     : FOLIO253+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 3 writers all writes
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((writer(X) => writes(X))) )).
fof(e0, axiom, ( writer(alice) )).
fof(e1, axiom, ( writer(bob) )).
fof(e2, axiom, ( writer(charlie) )).
fof(goal, conjecture, ( writes(alice) & writes(bob) & writes(charlie) )).
%------------------------------------------------------------------------------
