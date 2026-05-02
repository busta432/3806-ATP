%------------------------------------------------------------------------------
% File     : SET926+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : difference(sgtn(A),B) = empty | difference(sgtn(A),B) = sgtn(A)
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t69_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.06 v7.4.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.04 v7.0.0, 0.03 v6.4.0, 0.08 v6.3.0, 0.04 v6.1.0, 0.07 v6.0.0, 0.04 v5.5.0, 0.07 v5.3.0, 0.11 v5.2.0, 0.05 v5.0.0, 0.04 v3.7.0, 0.05 v3.4.0, 0.11 v3.3.0, 0.14 v3.2.0
% Syntax   : Number of formulae    :    7 (   3 unt;   0 def)
%            Number of atoms       :   11 (   4 equ)
%            Maximal formula atoms :    2 (   1 avg)
%            Number of connectives :    7 (   3   ~;   1   |;   0   &)
%                                         (   2 <=>;   1  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    5 (   3 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 1-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
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

fof(l34_zfmisc_1,axiom,
    ! [A,B] :
      ( set_difference(singleton(A),B) = singleton(A)
    <=> ~ in(A,B) ) ).

fof(l36_zfmisc_1,axiom,
    ! [A,B] :
      ( set_difference(singleton(A),B) = empty_set
    <=> in(A,B) ) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(t69_zfmisc_1,conjecture,
    ! [A,B] :
      ( set_difference(singleton(A),B) = empty_set
      | set_difference(singleton(A),B) = singleton(A) ) ).

%------------------------------------------------------------------------------
