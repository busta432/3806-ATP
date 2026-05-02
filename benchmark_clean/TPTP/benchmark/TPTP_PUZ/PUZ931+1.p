%------------------------------------------------------------------------------
% File     : PUZ931+1
% Domain   : Puzzles
% Problem  : widget has properties red,heavy,fragile
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(widget_red, axiom, ( ! [X] : ((widget(X) => red(X))) )).
fof(widget_heavy, axiom, ( ! [X] : ((widget(X) => heavy(X))) )).
fof(widget_fragile, axiom, ( ! [X] : ((widget(X) => fragile(X))) )).
fof(inst, axiom, ( widget(item1) )).
fof(goal, conjecture, ( red(item1) & heavy(item1) & fragile(item1) )).
%------------------------------------------------------------------------------
