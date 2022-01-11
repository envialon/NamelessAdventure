mainEntrance_puzzle() :- 
     inventory(InventoryList),
     member('main entrance key', InventoryList).

mainEntrance_puzzle(_) :- write('You need the key of the main entrance door to go outside.'), nl, fail.

