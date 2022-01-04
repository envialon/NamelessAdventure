%stating all dynamic predicates
:- dynamic here/1.
:- dynamic located/2.
:- dynamic inventory/1.


%rooms
room('main entrance').
room('kitchen').
room('living room').
room('dining hall').
room('bedroom1').
room('bedroom2').
room('trophy room').
room('library').
room('hidden room').
room('basement').
room('hallway').

%fact that states where the player is
here('main entrance').

%door(), trapdoor() or stairs() connects two rooms
door('main entrance', 'living room', open).
door('main entrance', 'dining hall', open).
door('hallway', 'Bedroom1',open).
door('hallway', 'Bedroom2',open).
door('hallway', 'trophy room',open).
door('hallway', 'library',open).
door('dining hall', 'kitchen',open).

stairs('main entrance', 'hallway',open).

trapdoor('kitchen', 'basment',hidden).


%connections
door_connection(X, Y) :- door(Y, X, open) ; door(X, Y, open).
trapdoor_connection(X, Y) :- trapdoor(X, Y, open) ; trapdoor(Y, X, open).
stairs_connection(X, Y) :- stairs(X, Y, open) ; stairs(Y, X, open).

%contained

%items in the inventory
inventory().


%edible items
edible().


% items
thing('key').
thing('flashlight').


%located(Something, Somewhere).
located('round table', 'living room').
located('key', 'round table').

contained(T1, T1) :- room(T1).
contained(T1, T2) :- located(T1, T2).
contained(T1, T2) :- located(T1, X), contained(X, T2).

%listing and looking
list_things(Place) :- located(X, Place), tab(2), write(X), nl, fail.
list_things(_).

list_connections(Place) :- door_connection(Place, X), tab(2), write(X), write(' through a door'), nl, fail.
list_connections(Place) :- trapdoor_connection(Place, X), tab(2), write(X), write(' through a trapdoor'), nl, fail.
list_connections(Place) :- stairs_connection(Place, X), tab(2), write(X), write(' through the stairs'), nl, fail.
list_connections(_).

look :- here(Place), 
        write('You are in the '), write(Place), nl,
        write('You can see:'), nl, (list_things(Place) ; write('nothing.')), nl,
        write('You can go to:'), nl, list_connections(Place).

%goto implementation
move(Place) :- retract(here(_)), asserta(here(Place)).

connects(CurrentPlace, Place) :- door_connection(CurrentPlace, Place) ; trapdoor_connection(CurrentPlace, Place); stairs_connection(CurrentPlace, Place).

can_go(Place) :- here(CurrentPlace), connects(CurrentPlace, Place).
can_go(_) :- write('You know you can''t get there from here, don''t be silly.'), nl, fail.

goto(Place):- can_go(Place), move(Place), look.


%pick implementation
confirm_pick_up(Thing, Place):- write('You took '), write(Thing), 
                                write(' from '), write(Place), 
                                write(' and you placed it in you inventory, great!'), nl.

pick_up(Thing, Place) :- retract(located(Thing, Place)), asserta(inventory(Thing)).

search_for_thing(Thing, Container) :- here(Room), contained(Thing, Room).%, located(Thing, Container).
search_for_thing(_) :- write('That thing is not here').

pick(Thing) :- search_for_thing(Thing, C), pick_up(Thing, C), confirm_pick_up(Thing, C).


%put implementation
place(Thing, Place) :- retract(inventory(Thing)), asserta(located(Thing, Place)).

can_place(Place) :- here(Room), contained(Place, Room).

put(Thing, Place) :- can_place(Place), place(Thing, Place).
put(Thing) :- here(Room), put(Thing, Room).


%look inventory
list_inventory :- inventory(X), tab(2), write(X), fail.
list_inventory.  

look_inventory :- write('Your inventory currently has:'), nl, list_inventory, nl.

%