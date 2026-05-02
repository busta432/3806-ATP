%------------------------------------------------------------------------------
% File     : CASC469+1
% Domain   : Competition (CASC-style)
% Problem  : Transitive 19-chain skip 2
% Status   : Theorem
% Rating   : 0.57 v1.0.0
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
fof(e9, axiom, ( link(v9,v10) )).
fof(e10, axiom, ( link(v10,v11) )).
fof(e11, axiom, ( link(v11,v12) )).
fof(e12, axiom, ( link(v12,v13) )).
fof(e13, axiom, ( link(v13,v14) )).
fof(e14, axiom, ( link(v14,v15) )).
fof(e15, axiom, ( link(v15,v16) )).
fof(e16, axiom, ( link(v16,v17) )).
fof(e17, axiom, ( link(v17,v18) )).
fof(e18, axiom, ( link(v18,v19) )).
fof(goal, conjecture, ( link(v0,v2) )).
%------------------------------------------------------------------------------
