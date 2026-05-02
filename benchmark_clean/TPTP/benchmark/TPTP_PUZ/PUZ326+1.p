%------------------------------------------------------------------------------
% File     : PUZ326+1
% Domain   : Puzzles
% Problem  : Classification python_lang is technology
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(sub_mid, axiom, ( ! [X] : ((programming(X) => computing(X))) )).
fof(mid_top, axiom, ( ! [X] : ((computing(X) => technology(X))) )).
fof(inst, axiom, ( programming(python_lang) )).
fof(goal, conjecture, ( technology(python_lang) )).
%------------------------------------------------------------------------------
