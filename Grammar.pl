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
verb(goto) --> [move, to].
verb(goto) --> [move].
verb(goto) --> [go, into].
verb(look_inventory) --> [inventory].
verb(look_inventory) --> [backpack].
verb(inspect) --> [inspect].
verb(inspect) --> [look, into].
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
noun(Room) -->
noun(Thing) --> [Thing], {thing(Thing)}.