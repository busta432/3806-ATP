%------------------------------------------------------------------------------
% File     : FOLIO252+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 2 writers all writes
% Status   : Theorem
% Rating   : 0.06 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((writer(X) => writes(X))) )).
fof(e0, axiom, ( writer(alice) )).
fof(e1, axiom, ( writer(bob) )).
fof(goal, conjecture, ( writes(alice) & writes(bob) )).
%------------------------------------------------------------------------------
