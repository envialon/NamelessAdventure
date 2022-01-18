has_killed_shepard(false).


lock_basement() :- retract(trapdoor('kitchen', 'basement', _)), asserta(trapdoor('kitchen', 'basement', closed)).
unlock_basement() :- retract(trapdoor('kitchen', 'basement', _)), asserta(trapdoor('kitchen', 'basement', open)).

bossfight() :-  boss_puzzle(),!. 
bossfight() :-  lock_basement(),
                bossfight_text(). 

boss_puzzle() :-    wearing('wolf head trophy'), 
                    write('When Shepard the weresheep looks at you wearing the wolf head,'), nl,
                    write('you literally scare him to death, you hold him while he''s coughing blood'), nl,
                    write('and you tell him that everything will be alright, then you close his hairy eyelids'), nl,
                    write('when he passes away, and you cry for a couple of minutes...'), nl, nl,
                    retract(has_killed_shepard(_)), asserta(has_killed_shepard(true)),
                    unlock_basement().

mainEntrance_puzzle() :- 
     (
     has('main entrance key'), 
     retract(door('main entrance', 'outside', closed)),
     asserta(door('main entrance', 'outside', open))
     ), !.
mainEntrance_puzzle() :- write('You need the key of the main entrance door to go outside.'), nl, nl, fail.

maid_room_puzzle() :-     
     (
     has('maid room key'), 
     retract(door('kitchen', 'maid room', closed)),
     asserta(door('kitchen', 'maid room', open))
     ), !.
maid_room_puzzle() :- write('You need the key of the maid room.'), nl, nl, fail.


basement_puzzle() :-  
     (has('torch'); has('candle holder')).
basement_puzzle() :- write('You need some kind of light to go down there, its very dark.'), nl, 
                     write('You could craft a torch if i had some kind of stick, a cloth and oil...'), nl, nl, !, fail.

crafting_torch_puzzle() :-
     (has('broom') ; has('victorian plunger')),
     has('oil'),
     has('cloth').
crafting_torch_puzzle() :- write('You could craft a torch if i had some kind of stick, a cloth and oil...'), nl, nl, fail.

loadCrossbow_puzzle() :-
     has('arrow'),
     has('unloaded crossbow').
loadCrossbow_puzzle() :- write('Don''t you think you need someting to load the crossbow with first?'), nl, nl, fail.

has_ended() :- here('outside'), has_killed_shepard(true), wearing('wolf trophy head'),  
               ending_text(a), halt(0).

has_ended() :- here('outside'), has_killed_shepard(true), 
               ending_text(b), halt(0).

has_ended() :- here('outside'), wearing('wolf trophy head'), not(has_killed_shepard(true)), 
               ending_text(c), halt(0).

has_ended() :- here('outside'), not(wearing('wolf trophy head')), not(has_killed_shepard(true)), 
               ending_text(d), halt(0). 
