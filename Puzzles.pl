has_killed_shepard():- fail. 

mainEntrance_puzzle() :- 
     inventory(InventoryList),
     (
     member('main entrance key', InventoryList), 
     retract(door('main entrance', 'outside', closed)),
     asserta(door('main entrance', 'outside', open))
     )
     ;
     (
     retract(door('main entrance', 'outside', open)),
     asserta(door('main entrance', 'outside', closed))
     ).
mainEntrance_puzzle() :- write('You need the key of the main entrance door to go outside.'), nl, fail.

maid_room_puzzle() :-     
     inventory(InventoryList),
     (
     member('maid room key', InventoryList), 
     retract(door('kitchen', 'maid room', closed)),
     asserta(door('kitchen', 'maid room', open))
     ) 
     ;
     (
     retract(door('kitchen', 'maid room', open)),
     asserta(door('kitchen', 'maid room', open))
     ).
maid_room_puzzle() :- write('You need the key of the maid room.'), nl, fail.

crafting_torch_puzzle() :-
     inventory(InventoryList), 
     (member('broom', InventoryList) ; member('victorian plunger', InventoryList)),
     member('oil', InventoryList),
     memeber('cloth', InventoryList).
crafting_torch_puzzle() :- write('You could craft a torch if i had some kind of stick, a cloth and oil...'), nl, fail.


basement_puzzle() :-
     inventory(InventoryList),     
     (member('torch', InventoryList);member('candle', InventoryList)).
basement_puzzle() :- write('You need some kind of light to go down there, its very dark...'), nl, fail.


loadCrossbow_puzzle() :-
     inventory(InventoryList),
     member('arrow', InventoryList),
     member('unloaded crossbow', InventoryList).
loadCrossbow_puzzle() :- write('Don''t you think you need someting to load the crossbow with first?'), nl, fail.


