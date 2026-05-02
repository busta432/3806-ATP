%------------------------------------------------------------------------------
% File     : SET947+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : subset(A,powerset(union(A)))
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t100_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.14 v8.1.0, 0.17 v7.5.0, 0.19 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.04 v7.0.0, 0.07 v6.4.0, 0.12 v6.3.0, 0.08 v6.2.0, 0.12 v6.1.0, 0.27 v6.0.0, 0.26 v5.5.0, 0.22 v5.4.0, 0.18 v5.3.0, 0.19 v5.2.0, 0.00 v5.0.0, 0.12 v4.1.0, 0.13 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0, 0.14 v3.2.0
% Syntax   : Number of formulae    :    8 (   4 unt;   0 def)
%            Number of atoms       :   14 (   1 equ)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :    8 (   2   ~;   0   |;   0   &)
%                                         (   3 <=>;   3  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   4 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   0 con; 1-1 aty)
%            Number of variables   :   15 (  13   !;   2   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) ).

fof(d1_zfmisc_1,axiom,
    ! [A,B] :
      ( B = powerset(A)
    <=> ! [C] :
          ( in(C,B)
        <=> subset(C,A) ) ) ).

fof(d3_tarski,axiom,
    ! [A,B] :
      ( subset(A,B)
    <=> ! [C] :
          ( in(C,A)
         => in(C,B) ) ) ).

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

fof(t100_zfmisc_1,conjecture,
    ! [A] : subset(A,powerset(union(A))) ).

%------------------------------------------------------------------------------
