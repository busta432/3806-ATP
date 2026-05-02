%------------------------------------------------------------------------------
% File     : FOLIO241+1
% Domain   : NL Reasoning (FOLIO-style)
% Problem  : 3 musicians all practices
% Status   : Theorem
% Rating   : 0.09 v1.0.0
% Source   : [FOLIO]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(rule, axiom, ( ! [X] : ((musician(X) => practices(X))) )).
fof(e0, axiom, ( musician(alice) )).
fof(e1, axiom, ( musician(bob) )).
fof(e2, axiom, ( musician(charlie) )).
fof(goal, conjecture, ( practices(alice) & practices(bob) & practices(charlie) )).
%------------------------------------------------------------------------------
