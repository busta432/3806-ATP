%------------------------------------------------------------------------------
% File     : SET890+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : union(singleton(A)) = A
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t31_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.28 v7.5.0, 0.31 v7.4.0, 0.23 v7.3.0, 0.24 v7.2.0, 0.21 v7.1.0, 0.17 v7.0.0, 0.07 v6.4.0, 0.12 v6.3.0, 0.17 v6.2.0, 0.16 v6.1.0, 0.27 v6.0.0, 0.35 v5.5.0, 0.33 v5.4.0, 0.32 v5.3.0, 0.37 v5.2.0, 0.20 v5.1.0, 0.19 v5.0.0, 0.29 v4.1.0, 0.30 v4.0.1, 0.26 v4.0.0, 0.25 v3.5.0, 0.26 v3.4.0, 0.32 v3.3.0, 0.29 v3.2.0
% Syntax   : Number of formulae    :   10 (   4 unt;   0 def)
%            Number of atoms       :   21 (   5 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   13 (   2   ~;   0   |;   2   &)
%                                         (   6 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   0 con; 1-1 aty)
%            Number of variables   :   21 (  18   !;   3   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) ).

fof(d10_xboole_0,axiom,
    ! [A,B] :
      ( A = B
    <=> ( subset(A,B)
        & subset(B,A) ) ) ).

fof(d1_tarski,axiom,
    ! [A,B] :
      ( B = singleton(A)
    <=> ! [C] :
          ( in(C,B)
        <=> C = A ) ) ).

fof(d3_tarski,axiom,
    ! [A,B] :
      ( subset(A,B)
    <=> ! [C] :
          ( in(C,A)
         => in(C,B) ) ) ).

fof(d4_tarski,axiom,
    ! [A,B] :
      ( B = union(A)
    <=> ! [C] :
          ( in(C,B)
        <=> ? [D] :
              ( in(C,D)
              & in(D,A) ) ) ) ).

fof(l50_zfmisc_1,axiom,
    ! [A,B] :
      ( in(A,B)
     => subset(A,union(B)) ) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(reflexivity_r1_tarski,axiom,
    ! [A,B] : subset(A,A) ).

fof(t31_zfmisc_1,conjecture,
    ! [A] : union(singleton(A)) = A ).

%------------------------------------------------------------------------------
