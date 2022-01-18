shoot(_) :-     here('basement'), not(has_killed_shepard(true)), has('loaded crossbow'), ending_text(g).

shoot(Something) :- inventory(InventoryList), has('loaded crossbow'),
            delete('loaded crossbow', InventoryList, DeletedList), add( 'unloaded crossbow', DeletedList, OutputList),  %create inventory list with the unloaded crossbow
            retract(inventory(_)), asserta(inventory(OutputList)),                                                      %update inventory
            asserta(located('arrow', Something)),                                                                       %spawn arrow somewhere 
            write('You shot the '), write(Something), write('with the arrow!.'), nl.
shoot() :-  here(CurrentPlace), shoot(CurrentPlace).

load_crossbow() :- loadCrossbow_puzzle(), inventory(InventoryList),
            delete('arrow', InventoryList, DeletedArrowList), delete('unloaded crossbow', DeletedArrowList, DeletedList),
            add( 'loaded crossbow', DeletedList, OutputList), 
            retract(inventory(_)), asserta(inventory(OutputList)), 
            write('You reloaded the crossbow.'), nl. 


wear_wolfHead() :- has('wolf head trophy'),
            retract(wearing(_)), asserta(wearing('wolf head trophy')), 
            write('Now you''re wearing the wolf head and you look a bit silly.'),nl.

craft_torch() :- craft_torch('whatever').
craft_torch(_) :-  crafting_torch_puzzle(), inventory(InventoryList),
            delete(oil, InventoryList, OillessList), delete(cloth, OillessList, ClothlessList), 
            (delete(broom, ClothlessList, SticklessList);delete('victorian plunger', ClothlessList, SticklessList)),
            add('torch', SticklessList, OutputList), retract(inventory(InventoryList)), asserta(inventory(OutputList)),
            write('You crafted a torch!').


pull_book() :-  here(library), retract(door('library', 'hidden room', hidden)),
                asserta(door('library', 'hidden room', open)),
                write('You pulled the book and the shelf moved revealing a hidden room!, how predictable...'), nl.

use_sword() :-  here('basement'), not(has_killed_shepard(true)), ending_text(e), halt(0). 

backflip_and_kick() :-  here('basement'), not(has_killed_shepard(true)), ending_text(f), halt(0).

use_spoon() :-  here('basement'), not(has_killed_shepard(true)),
                write('Shepard charges towards you enraged, but you pull up'), nl,
                write('the spoon and tap his nose, he screams in agony and explodes,'), nl, 
                write('covering you in sheep blood and guts.'), nl, 
                retract(has_killed_shepard(_)), asserta(has_killed_shepard(true)), 
                retract(trapdoor('kitchen', 'basement', _)), asserta(trapdoor('kitchen', 'basement', open)),
                unlock_basement().