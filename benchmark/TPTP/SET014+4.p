%------------------------------------------------------------------------------
% File     : SET014+4 : TPTP v8.1.2. Released v2.2.0.
% Domain   : Set Theory (Naive)
% Problem  : Union of subsets is a subset
% Version  : [Pas99] axioms.
% English  : If A and B are contained in C then the union of A and B is also.

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.42 v8.1.0, 0.36 v7.5.0, 0.41 v7.4.0, 0.37 v7.3.0, 0.34 v7.2.0, 0.31 v7.1.0, 0.30 v7.0.0, 0.40 v6.4.0, 0.42 v6.2.0, 0.48 v6.1.0, 0.53 v6.0.0, 0.52 v5.5.0, 0.56 v5.4.0, 0.57 v5.3.0, 0.59 v5.2.0, 0.55 v5.1.0, 0.57 v5.0.0, 0.50 v4.1.0, 0.48 v4.0.1, 0.52 v4.0.0, 0.54 v3.7.0, 0.55 v3.5.0, 0.58 v3.4.0, 0.63 v3.3.0, 0.50 v3.2.0, 0.45 v3.1.0, 0.67 v2.7.0, 0.83 v2.6.0, 0.71 v2.5.0, 0.88 v2.4.0, 0.25 v2.3.0, 0.00 v2.2.1
% Syntax   : Number of formulae    :   12 (   1 unt;   0 def)
%            Number of atoms       :   32 (   3 equ)
%            Maximal formula atoms :    3 (   2 avg)
%            Number of connectives :   22 (   2   ~;   2   |;   5   &)
%                                         (  11 <=>;   2  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 2-2 aty)
%            Number of functors    :    9 (   9 usr;   1 con; 0-2 aty)
%            Number of variables   :   31 (  30   !;   1   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%------------------------------------------------------------------------------
fof(thI45,conjecture,
    ! [A,X,Y] :
      ( ( subset(X,A)
        & subset(Y,A) )
    <=> subset(union(X,Y),A) ) ).

%------------------------------------------------------------------------------
