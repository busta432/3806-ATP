%------------------------------------------------------------------------------
% File     : FOLIO272+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: alice not accept so reject
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (accept(X) | reject(X)) )).
fof(xor2, axiom, ( ! [X] : (~(accept(X) & reject(X))) )).
fof(fact, axiom, ( ~accept(alice) )).
fof(goal, conjecture, ( reject(alice) )).
%------------------------------------------------------------------------------
