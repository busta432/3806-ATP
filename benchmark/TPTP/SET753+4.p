%------------------------------------------------------------------------------
% File     : SET753+4 : TPTP v8.1.2. Bugfixed v2.2.1.
% Domain   : Set Theory (Mappings)
% Problem  : Image of intersection is a subset of intersection of images
% Version  : [Pas99] axioms.
% English  :

% Refs     : [Pas99] Pastre (1999), Email to G. Sutcliffe
% Source   : [Pas99]
% Names    :

% Status   : Theorem
% Rating   : 0.64 v8.1.0, 0.58 v7.5.0, 0.62 v7.4.0, 0.53 v7.3.0, 0.66 v7.2.0, 0.62 v7.1.0, 0.57 v7.0.0, 0.63 v6.4.0, 0.65 v6.3.0, 0.71 v6.2.0, 0.60 v6.1.0, 0.67 v6.0.0, 0.74 v5.5.0, 0.78 v5.4.0, 0.86 v5.3.0, 0.89 v5.2.0, 0.90 v5.0.0, 0.88 v4.1.0, 0.83 v4.0.1, 0.91 v4.0.0, 0.92 v3.7.0, 0.90 v3.5.0, 0.89 v3.4.0, 0.95 v3.3.0, 0.93 v3.2.0, 0.91 v3.1.0, 0.89 v2.7.0, 0.83 v2.6.0, 0.86 v2.5.0, 0.88 v2.4.0, 0.50 v2.3.0, 0.33 v2.2.1
% Syntax   : Number of formulae    :   29 (   1 unt;   0 def)
%            Number of atoms       :  132 (   6 equ)
%            Maximal formula atoms :   11 (   4 avg)
%            Number of connectives :  105 (   2   ~;   2   |;  52   &)
%                                         (  30 <=>;  19  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   19 (   9 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :   16 (  15 usr;   0 prp; 2-6 aty)
%            Number of functors    :   15 (  15 usr;   1 con; 0-5 aty)
%            Number of variables   :  138 ( 129   !;   9   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
% Bugfixes : v2.2.1 - Bugfixes in SET006+1.ax.
%------------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%----Include mappings axioms
include('Axioms/SET006+1.ax').
%------------------------------------------------------------------------------
fof(thIIa03,conjecture,
    ! [F,A,B,X,Y] :
      ( ( maps(F,A,B)
        & subset(X,A)
        & subset(Y,A) )
     => subset(image2(F,intersection(X,Y)),intersection(image2(F,X),image2(F,Y))) ) ).

%------------------------------------------------------------------------------
