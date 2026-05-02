%------------------------------------------------------------------------------
% File     : CASC439+1
% Domain   : Competition (CASC-style)
% Problem  : Transitive 9-chain skip 2
% Status   : Theorem
% Rating   : 0.27 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(trans, axiom, ( ! [X,Y,Z] : ((link(X,Y) & link(Y,Z) => link(X,Z))) )).
fof(e0, axiom, ( link(v0,v1) )).
fof(e1, axiom, ( link(v1,v2) )).
fof(e2, axiom, ( link(v2,v3) )).
fof(e3, axiom, ( link(v3,v4) )).
fof(e4, axiom, ( link(v4,v5) )).
fof(e5, axiom, ( link(v5,v6) )).
fof(e6, axiom, ( link(v6,v7) )).
fof(e7, axiom, ( link(v7,v8) )).
fof(e8, axiom, ( link(v8,v9) )).
fof(goal, conjecture, ( link(v0,v2) )).
%------------------------------------------------------------------------------
