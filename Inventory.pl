%items in the inventory
inventory([]).

wearing(nothing).

has(Thing) :- inventory(InventoryList), member(Thing, InventoryList).


%pick implementation
confirm_pick_up(Thing, Place):- write('You took '), write(Thing), 
                                write(' from '), write(Place), 
                                write(' and you placed it in you inventory, great!'), nl.

pick_up(Thing, Place) :- retract(located(Thing, Place)), 
                         inventory(OldList), add(Thing, OldList, NewList), retract(inventory(_)),
                         asserta(inventory(NewList)).

search_for_thing(Thing, _) :- here(Room), contained(Thing, Room). %, located(Thing, Container).
search_for_thing(_) :- write('That thing is not here').

pick('red book') :- write('It doesn''t look like you can grab this one, maybe try inspecting it?'), !.  
pick('page5') :- retract(trapdoor('kitchen', 'basement',hidden)), 
                 asserta(trapdoor('kitchen', 'basement', open)), fail.
pick(Thing) :- search_for_thing(Thing, C), pick_up(Thing, C), confirm_pick_up(Thing, C).

:- op(35, fx, pick).


%put implementation
place(Thing, Place) :-  inventory(OldList), delete(Thing, OldList, NewList),
                        retract(inventory(_)), asserta(located(Thing, Place)),
                        asserta(inventory(NewList)).

can_place(Place) :- here(Room), contained(Place, Room).

put(Thing, Place) :- can_place(Place), place(Thing, Place).
put(Thing) :- here(Room), put(Thing, Room).
:- op(35, fx, put).

%look inventory
list_inventory :- inventory(X), tab(2), write(X), fail.
list_inventory.  


look_inventory :- write('Your inventory currently has:'), nl, list_inventory, nl.
look_inventory :- wearing(X), X is 'wolf head trophy', write('You''re also wearing a wolf head for some reason...'), nl, nl.

%read the pages you have collected.

readpage() :-   inventory(InventoryList), page(Page), member(Page,InventoryList),
                nl,flavor_text(Page),nl,nl, nl, fail.
readpage().



read() :-   page(X), has(X), 
            write('You piece together the pages of the diary that you have:'), nl, nl, nl,
            readpage(), !.

read() :- write('Dude you don''t have anything to read right now...'), nl,
write('Are you sure you even know what reading is?'), nl, !. 