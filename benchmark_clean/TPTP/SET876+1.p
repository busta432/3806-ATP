%------------------------------------------------------------------------------
% File     : SET876+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : A != B => disjoint(singleton(A),singleton(B))
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t17_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.11 v8.1.0, 0.17 v7.5.0, 0.19 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.04 v7.0.0, 0.03 v6.4.0, 0.08 v6.3.0, 0.04 v6.2.0, 0.12 v6.1.0, 0.17 v5.5.0, 0.11 v5.3.0, 0.19 v5.2.0, 0.00 v5.0.0, 0.12 v4.1.0, 0.13 v4.0.0, 0.12 v3.7.0, 0.10 v3.5.0, 0.11 v3.3.0, 0.14 v3.2.0
% Syntax   : Number of formulae    :    7 (   2 unt;   0 def)
%            Number of atoms       :   13 (   3 equ)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :   10 (   4   ~;   0   |;   0   &)
%                                         (   2 <=>;   4  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    6 (   4 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    4 (   3 usr;   0 prp; 1-2 aty)
%            Number of functors    :    1 (   1 usr;   0 con; 1-1 aty)
%            Number of variables   :   13 (  11   !;   2   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) ).

fof(d1_tarski,axiom,
    ! [A,B] :
      ( B = singleton(A)
    <=> ! [C] :
          ( in(C,B)
        <=> C = A ) ) ).

fof(l28_zfmisc_1,axiom,
    ! [A,B] :
      ( ~ in(A,B)
     => disjoint(singleton(A),B) ) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(symmetry_r1_xboole_0,axiom,
    ! [A,B] :
      ( disjoint(A,B)
     => disjoint(B,A) ) ).

fof(t17_zfmisc_1,conjecture,
    ! [A,B] :
      ( A != B
     => disjoint(singleton(A),singleton(B)) ) ).

%------------------------------------------------------------------------------
