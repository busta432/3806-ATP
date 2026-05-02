%------------------------------------------------------------------------------
% File     : FOLIO260+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: alice not alive so dead
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (alive(X) | dead(X)) )).
fof(xor2, axiom, ( ! [X] : (~(alive(X) & dead(X))) )).
fof(fact, axiom, ( ~alive(alice) )).
fof(goal, conjecture, ( dead(alice) )).
%------------------------------------------------------------------------------
