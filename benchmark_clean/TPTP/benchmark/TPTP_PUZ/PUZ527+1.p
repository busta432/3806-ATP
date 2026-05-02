%------------------------------------------------------------------------------
% File     : PUZ527+1
% Domain   : Puzzles
% Problem  : Graph coloring 4 nodes 3 colors
% Status   : Theorem
% Rating   : 0.40 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(v0_has_color, axiom, ( color(v0,col0) | color(v0,col1) | color(v0,col2) )).
fof(v1_has_color, axiom, ( color(v1,col0) | color(v1,col1) | color(v1,col2) )).
fof(v2_has_color, axiom, ( color(v2,col0) | color(v2,col1) | color(v2,col2) )).
fof(v3_has_color, axiom, ( color(v3,col0) | color(v3,col1) | color(v3,col2) )).
fof(adj0, axiom, ( adjacent(v0,v1) )).
fof(adj1, axiom, ( adjacent(v1,v2) )).
fof(adj2, axiom, ( adjacent(v2,v3) )).
fof(no_same, axiom, ( ! [X,Y,C] : ((adjacent(X,Y) & color(X,C) & color(Y,C) => $false)) )).
fof(goal, conjecture, ( ? [C] : (color(v0,C)) )).
%------------------------------------------------------------------------------
