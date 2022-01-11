%listing and looking
list_things(Place) :- located(X, Place), tab(2), write(X), nl, fail.
list_things(_).

list_connections(Place) :- door_connection(Place, X, open), tab(2), write(X), write(' through a door'), nl, fail.
list_connections(Place) :- trapdoor_connection(Place, X, open), tab(2), write(X), write(' through a trapdoor'), nl, fail.
list_connections(Place) :- stairs_connection(Place, X, open), tab(2), write(X), write(' through the stairs'), nl, fail.
list_connections(_).

look :- here(Place), 
        write('You are in the '), write(Place), nl,
        write('You can see:'), nl, (list_things(Place) ; write('nothing.')), nl,
        write('You can go to:'), nl, list_connections(Place).

inspect(_) :- write('What are you expecting this to tell you? There is literally nothing special about it').
