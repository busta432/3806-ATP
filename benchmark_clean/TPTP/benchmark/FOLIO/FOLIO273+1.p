%------------------------------------------------------------------------------
% File     : FOLIO273+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: bob not accept so reject
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (accept(X) | reject(X)) )).
fof(xor2, axiom, ( ! [X] : (~(accept(X) & reject(X))) )).
fof(fact, axiom, ( ~accept(bob) )).
fof(goal, conjecture, ( reject(bob) )).
%------------------------------------------------------------------------------
