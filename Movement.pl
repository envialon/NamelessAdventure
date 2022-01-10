%rooms
room('main entrance').
room('kitchen').
room('living room').
room('dining hall').
room('bedroom').
room('bathroom').
room('trophy room').
room('library').
room('hidden room').
room('basement').
room('hallway').
room('maid room').

%fact that states where the player is
here('main entrance').

%door(), trapdoor() or stairs() connects two rooms
door('main entrance', 'living room', open).
door('main entrance', 'dining hall', open).
door('hallway', 'Bedroom1', open).
door('hallway', 'Bedroom2', open).
door('hallway', 'trophy room', open).
door('hallway', 'library', open).
door('dining hall', 'kitchen', open).

stairs('main entrance', 'hallway',open).

trapdoor('kitchen', 'basment',hidden).


%connections
door_connection(X, Y) :- door(Y, X, open) ; door(X, Y, open).
trapdoor_connection(X, Y) :- trapdoor(X, Y, open) ; trapdoor(Y, X, open).
stairs_connection(X, Y) :- stairs(X, Y, open) ; stairs(Y, X, open).

%goto implementation
move(Place) :- retract(here(_)), asserta(here(Place)).

connects(CurrentPlace, Place) :- door_connection(CurrentPlace, Place) ; trapdoor_connection(CurrentPlace, Place); stairs_connection(CurrentPlace, Place).

can_go(Place) :- here(CurrentPlace), connects(CurrentPlace, Place).
can_go(_) :- write('You know you can''t get there from here, don''t be silly.'), nl, fail.

goto(Place):- can_go(Place), move(Place), look.
:- op(35, fx, goto).