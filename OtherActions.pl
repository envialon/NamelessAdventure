shoot(Something) :- inventory(InventoryList), member('loaded crossbow', InventoryList),
            delete('loaded crossbow', InventoryList, DeletedList), add( 'unloaded crossbow', DeletedList, OutputList),  %create inventory list with the unloaded crossbow
            retract(inventory(_)), asserta(inventory(OutputList)),                                                      %update inventory
            asserta(located('arrow', Something)),                                                                       %spawn arrow somewhere 
            write('You shot the '), write(Something), write('with the arrow!.'), nl.
shoot() :-  here(CurrentPlace), shoot(CurrentPlace).

load_crossbow() :- loadCrossbow_puzzle(), inventory(InventoryList),
            delete('arrow', InventoryList, DeletedArrowList), delete('unloaded crossbow', DeletedArrowList, DeletedList),add( 'loaded crossbow', DeletedList, OutputList), 
            retract(inventory(_)), asserta(inventory(OutputList)), 
            write('You reloaded the crossbow.'), nl. 


wear_wolfHead() :- inventory(InventoryList), member('wolf head trophy', InventoryList),
            retract(wearing(_)), asserta(wearing('wolf head trophy')), 
            write('Now you''re wearing the wolf head and you look a bit silly.'),nl.

craft_torch() :-  crafting_torch_puzzle(), inventory(InventoryList),
            delete(oil, InventoryList, OillessList), delete(cloth, OillessList, ClothlessList), 
            (delete(broom, ClothlessList, SticklessList);delete('victorian plunger', ClothlessList, SticklessList)),
            add('torch', SticklessList, OutputList), retract(inventory(InventoryList)), asserta(inventory(OutputList)),
            write('You crafted a torch!').

pull_book() :-  here(library), retract(door('library', 'hidden room', hidden)),
                asserta(door('library', 'hidden room', open)),
                write('You pulled the book and the shelf moved revealing a hidden room!, how predictable...'), nl.