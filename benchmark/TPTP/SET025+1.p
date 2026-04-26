%--------------------------------------------------------------------------
% File     : SET025+1 : TPTP v8.1.2. Bugfixed v5.4.0.
% Domain   : Set Theory
% Problem  : An ordered pair is a set
% Version  : [Qua92] axioms : Reduced & Augmented > Complete.
% English  :

% Refs     : [Qua92] Quaife (1992), Automated Deduction in von Neumann-Bern
%          : [BL+86] Boyer et al. (1986), Set Theory in First-Order Logic:
% Source   : [Qua92]
% Names    :

% Status   : Theorem
% Rating   : 0.08 v8.1.0, 0.14 v7.5.0, 0.16 v7.4.0, 0.13 v7.3.0, 0.14 v7.1.0, 0.09 v7.0.0, 0.17 v6.4.0, 0.19 v6.3.0, 0.17 v6.2.0, 0.20 v6.0.0, 0.22 v5.5.0, 0.11 v5.4.0
% Syntax   : Number of formulae    :   44 (  17 unt;   0 def)
%            Number of atoms       :  101 (  19 equ)
%            Maximal formula atoms :    4 (   2 avg)
%            Number of connectives :   62 (   5   ~;   3   |;  26   &)
%                                         (  19 <=>;   9  =>;   0  <=;   0 <~>)
%            Maximal formula depth :    7 (   4 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    6 (   5 usr;   0 prp; 1-2 aty)
%            Number of functors    :   26 (  26 usr;   5 con; 0-3 aty)
%            Number of variables   :   88 (  83   !;   5   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixed : v5.4.0 - Bugfixes to SET005+0 axiom file.
%--------------------------------------------------------------------------
%----Include set theory axioms
include('Axioms/SET005+0.ax').
%--------------------------------------------------------------------------
%----OP1: An ordered pair is a set.
fof(ordered_pair_is_set,conjecture,
    ! [X,Y] : member(ordered_pair(X,Y),universal_class) ).

%--------------------------------------------------------------------------
