%------------------------------------------------------------------------------
% File     : SET985+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : Basic properties of sets, theorem 139
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t139_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.11 v8.1.0, 0.14 v7.5.0, 0.16 v7.4.0, 0.07 v7.3.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.09 v7.0.0, 0.03 v6.4.0, 0.08 v6.2.0, 0.16 v6.1.0, 0.20 v6.0.0, 0.13 v5.5.0, 0.07 v5.4.0, 0.14 v5.3.0, 0.19 v5.2.0, 0.05 v5.0.0, 0.08 v4.1.0, 0.13 v4.0.1, 0.17 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0, 0.07 v3.2.0
% Syntax   : Number of formulae    :    8 (   5 unt;   0 def)
%            Number of atoms       :   16 (   4 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   10 (   2   ~;   3   |;   1   &)
%                                         (   1 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    8 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-2 aty)
%            Number of variables   :   15 (  13   !;   2   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(fc1_xboole_0,axiom,
    empty(empty_set) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(reflexivity_r1_tarski,axiom,
    ! [A,B] : subset(A,A) ).

fof(t113_zfmisc_1,axiom,
    ! [A,B] :
      ( cartesian_product2(A,B) = empty_set
    <=> ( A = empty_set
        | B = empty_set ) ) ).

fof(t138_zfmisc_1,axiom,
    ! [A,B,C,D] :
      ( subset(cartesian_product2(A,B),cartesian_product2(C,D))
     => ( cartesian_product2(A,B) = empty_set
        | ( subset(A,C)
          & subset(B,D) ) ) ) ).

fof(t139_zfmisc_1,conjecture,
    ! [A] :
      ( ~ empty(A)
     => ! [B,C,D] :
          ( ( subset(cartesian_product2(A,B),cartesian_product2(C,D))
            | subset(cartesian_product2(B,A),cartesian_product2(D,C)) )
         => subset(B,D) ) ) ).

fof(t2_xboole_1,axiom,
    ! [A] : subset(empty_set,A) ).

%------------------------------------------------------------------------------
