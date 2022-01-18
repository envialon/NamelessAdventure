%listing and looking
has_locked_connection(Place) :-door_connection(Place, _, closed).
list_locked_connections(Place) :- door_connection(Place, X, closed), tab(2), write('to '), write(X), nl, fail.

list_connections(Place) :- door_connection(Place, X, open), tab(2), write(X), write(' through a door'), nl, fail.
list_connections(Place) :- trapdoor_connection(Place, X, open), tab(2), write(X), write(' through a trapdoor'), nl.
list_connections(Place) :- stairs_connection(X, Place), tab(2), write(X), write(' through the stairs'), nl.
list_connections(_).


look :- here('basement'), not(has_killed_shepard(true)), flavor_text('basement'), bossfight_text(), !.
look :- here(Place), 
        write('You are in the '), write(Place), nl, nl,
        inspect(Place), nl,
        write('You can go to:'), nl, list_connections(Place),
        ((has_locked_connection(Place), write('There are locked doors: '), nl, list_locked_connections(Place)) ; true).

%inspect
has_something(Thing) :- located(_, Thing).
list_things(Place) :- located(X, Place), tab(2), write(X), nl, fail.
list_things(_).

inspect(Thing) :- flavor_text(Thing),nl,  ((has_something(Thing), fail) ; not(has_something(Thing)), write(Thing), write(' has nothing.'), nl).
inspect(Thing) :- write(Thing), write(' has:'), nl, list_things(Thing), nl, !.
inspect(_) :- write('What are you expecting this to tell you? There is literally nothing special about it').

%flavor text

flavor_text('main entrance') :-     write('The long red carpet on the floor, tall paintings of '), nl, 
                                write('previous lords and chandeliers give the room an ominous feeling'), nl.                                
flavor_text('hidden room'):-        write('Wow! you found a hidden room! Damn it looks like it was so well hidden,'), nl,
                                write('even the owners of the mansion did''t know it existed, there''s nothing inside.'), nl.
flavor_text('bathroom'):-           write('Its a very well cleaned bathroom, the maid must have done a good job, but they left the plunger on the toilet...').
flavor_text('trophy room'):-        write('It looks like Lord Shepard liked to hunt. The room is full of hunting trophies'), nl,
                                write('and a very dangerous looking crossbow in the wall.'), nl.
flavor_text('library'):-            write('Wow! a private library. Damn this Shepard dude is such a nerd, what a loser'), nl,
                                write('There are lots of books on the shelves in every wall on the room, and a singular bureau in the middle.'), nl,
                                write('Strangely there''s only one red book...'), nl.
flavor_text('bedroom'):-            write('Lord Shepard has a very bad taste for interior decoration, his bedroom doesn''t fit with the rest of the mansion.'), nl,
                                write('You can''t tell why but you get the feeling that they are very cheap swedish furniture made of wood-chip planks...'), nl,
                                write('There is a hanger next to the window with a red coat on it.'), nl.
flavor_text('basement') :-      write('No way! the trap door suddently locked behind you and a very epic and tense music starts playing.'), nl,
                                write('In the middle of the basement, barely iluminated you can see him, Lord Shepard, the weresheep.'), nl,
                                write('He looks very angry and wooly...'), nl.         
flavor_text('maid room') :-         write('Damn this is the saddest room ever to exist, it looks like it was used to store potatoes.'), nl,
                                write('There''s a female corpse decomposing in the corner of the room and a silver spoon in the floor next to it.').
flavor_text('hallway') :-           write('A very impressive hallway filled with lots and lots of interesting stuff,'), nl,
                                write('like doors.'), nl.
flavor_text('kitchen') :-           write('Its a very large kitchen!, full of ingredients and cooked food, it smells very good, but you get a brief scent'), nl,
                                write('of rotten, probably something has spoiled. There''s a big kitchen table in the middle of the room and one of the'), nl,
                                write('cupboard door is open.'), nl.
flavor_text('living room') :-       write('Very cozy living room! it has a lit fireplace keeping everything nice and warm. There''s also a round table'), nl,       
                                write('and some comfortable looking sofas.'), nl.
flavor_text('dining hall') :-       write('Wow how mainstream, a very very very long table with a candle holder and a chair in both ends,'), nl, 
                                write('what else did you expect from a Lord''s mansion''s dining hall?'), nl.

flavor_text('page1') :- write('I have just accepted the job for lord shepard.'), nl, 
                        write('He seems to be a reserved man, good.'), nl, 
                        write('Hopefully he is not too demanding and I''ll have an easier time,'), nl, 
                        write('I feel like his mansion is too big for only one maid to handle...'),nl.

flavor_text('page2') :- write('This is preposterous! I am enraged!'), nl, 
                        write('The lord keeps me in a dark and humid burrow next to the kitchen,'), nl,
                        write('and he has the audacity to call it a room!'), nl, 
                        write('There''s only one ''window'' as the lord calls it in the room, a hole close to the ceiling...'),nl.

flavor_text('page3') :- write('The nauseating smell of the pigs feces swarms the room during the day.'), nl,
                        write('I have tried to perfumate the room and block the hole (that faces the barn).'), nl, 
                        write('I have never been subjected to this kind of inhumane living conditions. Measures must be taken...'),nl.

flavor_text('page4') :- write('While buying meat in the market, I heard two grandmas'), nl, 
                        write('talking about a mysterious hag that lives in the forest up north.'), nl, 
                        write('They claimed she was a witch, I don''t believe that nonsense,'), nl, 
                        write('but Lord Shepard seems to be superstitious... '), nl, 
                        write('Maybe I can scare him enough to give me a decent room.'), nl,
                        write('Heh, I''ll ask the witch for a ''curse'' to turn him into a werewolf,'), nl, 
                        write('that''s so clever of me, because he''s called shepard,'), nl, 
                        write('and shepards don''t like wolves hehehe, did you get it?'),nl.

flavor_text('page5') :- write('I am terrified, the curse actually worked, it didn''t turn him into a werewolf...'), nl, write('
                        But into a weresheep! Exactly the same as a werewolf but as a sheep,'), nl,
                        write('even though his wool seems as soft as a cloud he is very aggressive...'), nl, 
                        write('I pushed him into the basement''s trap door and managed to lock him under the kitchen,'), nl, 
                        write('but he mortally wounded me. I''m about to die soon...'), nl, 
                        write('If someone is reading me, please, avenge me...'), nl, 
                        write('weresheep are famous for actually being immortal and being immune to everything'), nl, 
                        write('except for silver...'), nl, 
                        write('also for being scared by wolves and having very soft wool.'),nl.

flavor_text('red book') :- write('It is a big and red book, its title says ''PULL ME'', what a suspicious book.'), nl.

flavor_text('spoon') :- write('A very silvery spoon, still has some rests of the food it picked...'), nl.

flavor_text('victorian plunger') :- write('A very fancy plunger with diamonds incrusted on the wooden handle'), nl.

flavor_text('broom') :- write('A literal broom'), nl.


bossfight_text() :- write('What are you going to do?'), nl, fail.
bossfight_text() :- has('loaded crossbow'), tab(3), write('Shoot'), nl, fail.
bossfight_text() :- has('big sword'), tab(3), write('Use the sword'), nl, fail.
bossfight_text() :- has('spoon'), tab(3), write('Use the spoon'), nl, fail.
bossfight_text() :- tab(3), write('Backflip and a 540 kick'), nl, nl.

ending_text(a) :-       write('You proudly walk away from the house, feeling great'), nl,
                        write('after commiting such an heroic act, but you''re covered in blood'), nl,
                        write('and wearing a wolf head, you look like a maniac,'), nl,
                        write('the police beat you down and arrest you, of course.'), nl, nl.

ending_text(b) :-       write('You proudly walk away from the house, feeling great'), nl,
                        write('after commiting such an heroic act, there''s a parade'), nl,
                        write('to celebrate waiting for you in the town, kinda weird,'), nl,
                        write('when did they prepare all of this?'), nl, nl.          

ending_text(c) :-       write('You walk outside looking like an absolute clown wearing that wolf head,'), nl, 
                        write('while walking away form the house, heading to the distant town,'), nl, 
                        write('you can''t help but feel that there''s something more to that mansion...'), nl, nl.

ending_text(d) :-       write('You use the key to unlock the door, and when you''re turning the'), nl, 
                        write('door handle to finally go outside, you hear very fast steps coming towards you.'), nl, 
                        write('it was very fast, you couldn''t even react, something very soft tackled you and'), nl,
                        write('cracked your skull in the floor like an egg.'), nl, nl.

ending_text(e) :-       write('You lift the heavy sword and slash shepard,'), nl,
                        write('but his thic wool stops the blow before it even reachs the skin.'), nl,
                        write('That was underwhelming, anyways, he crushes your skull with his hands.'), nl, nl.

ending_text(f) :-       write('You don''t have any kind of acrobatic skills,'), nl,
                        write('you jump backwards and crack your skull in the floor while trying to backflip...'), nl,
                        write('What were you thinking? Anyways, you''re dead, obviously.'), nl, nl.

ending_text(g) :-       write('You shoot at shepard with the crossbow,'), nl,
                        write('The arrow didn''t even reach his skin, because of his thick and soft wool.'), nl,
                        write('He crushes your skull with both hands and you die.'), nl, halt(0).