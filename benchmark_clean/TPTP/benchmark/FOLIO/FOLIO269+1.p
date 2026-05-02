%------------------------------------------------------------------------------
% File     : FOLIO269+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: bob not pass so fail
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (pass(X) | fail(X)) )).
fof(xor2, axiom, ( ! [X] : (~(pass(X) & fail(X))) )).
fof(fact, axiom, ( ~pass(bob) )).
fof(goal, conjecture, ( fail(bob) )).
%------------------------------------------------------------------------------
