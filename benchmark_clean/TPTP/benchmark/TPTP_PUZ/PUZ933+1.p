%------------------------------------------------------------------------------
% File     : PUZ933+1
% Domain   : Puzzles
% Problem  : widget has properties green,medium,flexible
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(widget_green, axiom, ( ! [X] : ((widget(X) => green(X))) )).
fof(widget_medium, axiom, ( ! [X] : ((widget(X) => medium(X))) )).
fof(widget_flexible, axiom, ( ! [X] : ((widget(X) => flexible(X))) )).
fof(inst, axiom, ( widget(item1) )).
fof(goal, conjecture, ( green(item1) & medium(item1) & flexible(item1) )).
%------------------------------------------------------------------------------
