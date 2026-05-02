%------------------------------------------------------------------------------
% File     : LB_MMP_03
% Domain   : Inference Rules (LogicBench)
% Problem  : Multi-hop Modus Ponens instance 3
% Status   : Theorem
% Rating   : 0.18 v1.0.0
% Source   : [LogicBench]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(p1, axiom, ( ! [X] : ((gamma(X) => mid1_2(X))) )).
fof(p2, axiom, ( ! [X] : ((mid1_2(X) => mid2_2(X))) )).
fof(p3, axiom, ( ! [X] : ((mid2_2(X) => theta(X))) )).
fof(p4, axiom, ( gamma(c2) )).
fof(goal, conjecture, ( theta(c2) )).
%------------------------------------------------------------------------------
