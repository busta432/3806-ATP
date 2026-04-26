%------------------------------------------------------------------------------
% File     : SET789+4 : TPTP v8.1.2. Released v3.2.0.
% Domain   : Set Theory (Order relations)
% Problem  : The greatest element, if it existes, is unique
% Version  : [Pas05] axioms.
% English  :

% Refs     : [Pas05] Pastre (2005), Email to G. Sutcliffe
% Source   : [Pas05]
% Names    :

% Status   : Theorem
% Rating   : 0.03 v8.1.0, 0.00 v6.3.0, 0.04 v6.1.0, 0.03 v6.0.0, 0.04 v5.5.0, 0.00 v5.3.0, 0.07 v5.2.0, 0.05 v5.0.0, 0.00 v4.1.0, 0.04 v3.7.0, 0.14 v3.5.0, 0.11 v3.4.0, 0.08 v3.3.0, 0.11 v3.2.0
% Syntax   : Number of formulae    :   11 (   0 unt;   0 def)
%            Number of atoms       :   60 (   4 equ)
%            Maximal formula atoms :   14 (   5 avg)
%            Number of connectives :   49 (   0   ~;   1   |;  22   &)
%                                         (  10 <=>;  16  =>;   0  <=;   0 <~>)
%            Maximal formula depth :   12 (   9 avg)
%            Maximal term depth    :    1 (   1 avg)
%            Number of predicates  :   13 (  12 usr;   0 prp; 2-4 aty)
%            Number of functors    :    0 (   0 usr;   0 con; --- aty)
%            Number of variables   :   50 (  50   !;   0   ?)
% SPC      : FOF_THM_RFO_SEQ

% Comments :
%------------------------------------------------------------------------------
%----Include order relation axioms
include('Axioms/SET006+3.ax').
%------------------------------------------------------------------------------
fof(thIV1,conjecture,
    ! [R,E,M] :
      ( ( order(R,E)
        & greatest(M,R,E) )
     => ! [X] :
          ( greatest(X,R,E)
         => M = X ) ) ).

%------------------------------------------------------------------------------
