%------------------------------------------------------------------------------
% File     : FOLIO228+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : Symmetric colleague_of
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sym, axiom, ( ! [X,Y] : ((colleague_of(X,Y) => colleague_of(Y,X))) )).
fof(fact, axiom, ( colleague_of(alice,bob) )).
fof(goal, conjecture, ( colleague_of(bob,alice) )).
%------------------------------------------------------------------------------
