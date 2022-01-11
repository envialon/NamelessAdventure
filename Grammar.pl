nlp_transformation([Action, Object]) --> verb(Action), nounphrase(Object).
nlp_transformation([Action]) --> verb(Action).

nounphrase(Object) --> det, noun(Object).
nounphrase(Object) --> noun(Object).

%verbs
verb(look) --> [look].
verb(look) --> [look, around].
verb(end) --> [end].
verb(end) --> [quit].
verb(end) --> [exit].
verb(goto) --> [go, to].
verb(goto) --> [go, back].
verb(goto) --> [go, back, to].
verb(goto) --> [go].
verb(goto) --> [move, to].
verb(goto) --> [move].
verb(goto) --> [go, into].
verb(look_inventory) --> [inventory].
verb(look_inventory) --> [backpack].
verb(inspect) --> [inspect].
verb(inspect) --> [look, into].
verb(inspect) --> [check, out].
verb(take) --> [take].
verb(take) --> [grab].
verb(take) --> [pick, up].
verb(take) --> [get].
verb(put) --> [put, down].
verb(put) --> [put].
verb(put) --> [drop].

%dets
det --> [this].
det --> [that].
det --> [the].
det --> [a].

%this notation includes all rooms that have single word names.
noun(Room) --> [Room], {room(Room)}.
noun('main entrance') --> [main, entrance].
noun('living room') --> [living, room].
noun('trophy room') --> [trophy, room].
noun('maid room') --> [maid, room].
noun('dining hall') --> [dining, hall].


noun(Thing) --> [Thing], {thing(Thing)}.
noun(Something) --> [Something], {located(_, Something); located(Something, _)}.
noun('main entrance key') --> [main, entrance, key].
noun('big sword') --> [big, sword].
noun('loaded crossbow') --> [loaded, crossbow].
noun('butchers knife') --> [butchers, knife].
noun('wolf head trophy') --> [wolf, head, trophy].
noun('dining table') --> [dining, table].
noun('candle holder') --> [candle, holder].
noun('red coat') --> [red, coat].
noun('victorian plunger') --> [victorian, plunger].
noun('kitchen table') --> [kitchen, table].

