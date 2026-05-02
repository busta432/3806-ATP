%------------------------------------------------------------------------------
% File     : SET923+1 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set theory
% Problem  : ~ ( difference(A,sgtn(B)) = empty & A != empty & A != sgtn(B) )
% Version  : [Urb06] axioms : Especial.
% English  :

% Refs     : [Byl90] Bylinski (1990), Some Basic Properties of Sets
%          : [Urb06] Urban (2006), Email to G. Sutcliffe
% Source   : [Urb06]
% Names    : zfmisc_1__t66_zfmisc_1 [Urb06]

% Status   : Theorem
% Rating   : 0.11 v8.1.0, 0.08 v7.5.0, 0.09 v7.4.0, 0.07 v7.2.0, 0.03 v7.1.0, 0.04 v7.0.0, 0.03 v6.4.0, 0.08 v6.3.0, 0.00 v6.2.0, 0.04 v6.1.0, 0.07 v6.0.0, 0.00 v5.3.0, 0.04 v5.2.0, 0.00 v3.4.0, 0.05 v3.3.0, 0.07 v3.2.0
% Syntax   : Number of formulae    :    7 (   4 unt;   0 def)
%            Number of atoms       :   12 (   6 equ)
%            Maximal formula atoms :    3 (   1 avg)
%            Number of connectives :    9 (   4   ~;   1   |;   2   &)
%                                         (   2 <=>;   0  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    3 (   2 usr;   0 prp; 1-2 aty)
%            Number of functors    :    3 (   3 usr;   1 con; 0-2 aty)
%            Number of variables   :   10 (   8   !;   2   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments : Translated by MPTP 0.2 from the original problem in the Mizar
%            library, www.mizar.org
%------------------------------------------------------------------------------
fof(fc1_xboole_0,axiom,
    empty(empty_set) ).

fof(l4_zfmisc_1,axiom,
    ! [A,B] :
      ( subset(A,singleton(B))
    <=> ( A = empty_set
        | A = singleton(B) ) ) ).

fof(rc1_xboole_0,axiom,
    ? [A] : empty(A) ).

fof(rc2_xboole_0,axiom,
    ? [A] : ~ empty(A) ).

fof(reflexivity_r1_tarski,axiom,
    ! [A,B] : subset(A,A) ).

fof(t37_xboole_1,axiom,
    ! [A,B] :
      ( set_difference(A,B) = empty_set
    <=> subset(A,B) ) ).

fof(t66_zfmisc_1,conjecture,
    ! [A,B] :
      ~ ( set_difference(A,singleton(B)) = empty_set
        & A != empty_set
        & A != singleton(B) ) ).

%------------------------------------------------------------------------------
