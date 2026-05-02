%------------------------------------------------------------------------------
% File     : PUZ932+1
% Domain   : Puzzles
% Problem  : widget has properties blue,light,durable
% Status   : Theorem
% Rating   : 0.08 v1.0.0
% Source   : [PUZ]
% SPC      : FOF_THM
%------------------------------------------------------------------------------
fof(widget_blue, axiom, ( ! [X] : ((widget(X) => blue(X))) )).
fof(widget_light, axiom, ( ! [X] : ((widget(X) => light(X))) )).
fof(widget_durable, axiom, ( ! [X] : ((widget(X) => durable(X))) )).
fof(inst, axiom, ( widget(item1) )).
fof(goal, conjecture, ( blue(item1) & light(item1) & durable(item1) )).
%------------------------------------------------------------------------------
