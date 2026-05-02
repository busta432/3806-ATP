%------------------------------------------------------------------------------
% File     : PUZ328+1
% Domain   : Puzzles
% Problem  : Classification rust_lang is technology
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((programming(X) => computing(X))) )).
fof(mid_top, axiom, ( ! [X] : ((computing(X) => technology(X))) )).
fof(inst, axiom, ( programming(rust_lang) )).
fof(goal, conjecture, ( technology(rust_lang) )).
%------------------------------------------------------------------------------
