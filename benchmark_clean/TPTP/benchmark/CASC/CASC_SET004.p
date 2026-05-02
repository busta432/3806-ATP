%------------------------------------------------------------------------------
% File     : CASC_SET004
% Domain   : Competition (CASC-style)
% Problem  : Empty set
% Status   : Theorem
% Rating   : 0.15 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(ed, axiom, ( ! [X] : (~member(X,empty)) )).
fof(goal, conjecture, ( ~member(a,empty) )).
%------------------------------------------------------------------------------
