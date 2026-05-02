%------------------------------------------------------------------------------
% File     : SET900+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : ~ ( A != singleton(B) & A != empty_set & ~ ( in(C,A) & C != B ) )
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t41_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.08 v7.5.0, 0.09 v7.4.0, 0.10 v7.2.0, 0.07 v7.1.0, 0.09 v7.0.0, 0.10 v6.4.0, 0.15 v6.3.0, 0.12 v6.1.0, 0.13 v5.5.0, 0.07 v5.3.0, 0.15 v5.2.0, 0.05 v5.0.0, 0.04 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0, 0.14 v3.2.0
% Syntax   : Number of formulae    :    6 (   3 unt;   0 def)
%            Number of atoms       :   13 (   6 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   19 (  12   ~;   0   |;   6   &)
%                                         (   0 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   10 (   5 avg)
%            Maximal term depth    :    2 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 1-2 aty)
%            Number of functors    :    2 (   2 usr;   1 con; 0-1 aty)
%            Number of variables   :   10 (   8   !;   2   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(antisymmetry_r2_hidden,axiom,
    ! [A,B] :
      ( in(A,B)
     => ~ in(B,A) ) ).

fof(fc1_xboole_0,axiom,
    empty(empty_set) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(t41_zfmisc_1,conjecture,
    ! [A,B] :
      ~ ( A != singleton(B)
        & A != empty_set
        & ! [C] :
            ~ ( in(C,A)
              & C != B ) ) ).

fof(l45_zfmisc_1,axiom,
    ! [A,B] :
      ~ ( A != singleton(B)
        & A != empty_set
        & ! [C] :
            ~ ( in(C,A)
              & C != B ) ) ).

%------------------------------------------------------------------------------
