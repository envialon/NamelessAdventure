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
room('outside').

%fact that states where the player is
here('main entrance').

%door(), trapdoor() or stairs() connects two rooms
door('main entrance', 'living room', open).
door('main entrance', 'dining hall', open).
door('main entrance', 'outside', closed).
door('hallway', 'Bathroom', open).
door('hallway', 'trophy room', open).
door('hallway', 'library', open).
door('library', 'hidden room', hidden).
door('dining hall', 'kitchen', open).
door('kitchen', 'maid room', closed).

stairs('main entrance', 'hallway',open).

trapdoor('kitchen', 'basment',hidden).


%connections
door_connection(X, Y, State) :- door(Y, X, State) ; door(X, Y, State).
trapdoor_connection(X, Y, State) :- trapdoor(X, Y, State) ; trapdoor(X, Y, State).
stairs_connection(X, Y, State) :- stairs(X, Y, State) ; stairs(X, Y, State).

connects(X, Y, State) :- door(Y, X, State) ; door(X, Y, State).
connects(X, Y, State) :- trapdoor(X, Y, State) ; trapdoor(Y, X, State).
connects(X, Y, State) :- stairs(X, Y, State) ; stairs(Y, X, State).

%goto implementation
move(Place) :- retract(here(_)), asserta(here(Place)).

%connects(CurrentPlace, Place) :- door_connection(CurrentPlace, Place) ; trapdoor_connection(CurrentPlace, Place); stairs_connection(CurrentPlace, Place).

can_go('outside') :- mainEntrance_puzzle(), cango('outside').
can_go(Place) :- here(CurrentPlace), connects(CurrentPlace, Place, open).

can_go(Place) :- here(CurrentPlace), connects(CurrentPlace, Place, open).
can_go(Place) :- here(CurrentPlace), connects(CurrentPlace, Place, closed), write(Place), write(' is locked.'), nl, fail, !.
can_go(_) :- write('You know you can''t get there from here, don''t be silly.'), nl, fail.

goto(Place):- can_go(Place), move(Place), look.
:- op(35, fx, goto).