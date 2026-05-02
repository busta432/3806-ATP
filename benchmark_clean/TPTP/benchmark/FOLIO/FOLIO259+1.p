%------------------------------------------------------------------------------
% File     : FOLIO259+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : XOR: diana not guilty so innocent
% Status   : Theorem
% Rating   : 0.10 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(xor1, axiom, ( ! [X] : (guilty(X) | innocent(X)) )).
fof(xor2, axiom, ( ! [X] : (~(guilty(X) & innocent(X))) )).
fof(fact, axiom, ( ~guilty(diana) )).
fof(goal, conjecture, ( innocent(diana) )).
%------------------------------------------------------------------------------
