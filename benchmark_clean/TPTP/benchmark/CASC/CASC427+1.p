%------------------------------------------------------------------------------
% File     : CASC427+1
% Domain   : Competition (CASC-style)
% Problem  : Ring theory: Neg of zero
% Status   : Theorem
% Rating   : 0.65 v1.0.0
% Source   : [CASC]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(add_assoc, axiom, ( ! [X,Y,Z] : (add(add(X,Y),Z) = add(X,add(Y,Z))) )).
fof(add_comm, axiom, ( ! [X,Y] : (add(X,Y) = add(Y,X)) )).
fof(add_id, axiom, ( ! [X] : (add(X,zero_r) = X) )).
fof(add_inv, axiom, ( ! [X] : (add(X,neg_r(X)) = zero_r) )).
fof(mul_assoc, axiom, ( ! [X,Y,Z] : (mul(mul(X,Y),Z) = mul(X,mul(Y,Z))) )).
fof(dist_l, axiom, ( ! [X,Y,Z] : (mul(X,add(Y,Z)) = add(mul(X,Y),mul(X,Z))) )).
fof(dist_r, axiom, ( ! [X,Y,Z] : (mul(add(X,Y),Z) = add(mul(X,Z),mul(Y,Z))) )).
fof(goal, conjecture, ( neg_r(zero_r) = zero_r )).
%------------------------------------------------------------------------------
