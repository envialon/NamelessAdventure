% items
thing('main entrance key').
thing('big sword').
thing('spoon').
thing('loaded crossbow').
thing('butchers knife').
thing('wolf head trophy').
thing('torch').
thing('cloth').
thing('oil').
thing('candle').
thing('broom').
thing('victorian plunger').


%located(Something, Somewhere).

%kitchen
located('kitchen table', kitchen).
located(cupboard, kitchen).
located('spoon', 'kitchen table').
located(oil, cupboard).
located(cloth, 'kitchen table').
located(broom, kitchen).
located('butrchers knife', 'kitchen table').

%dining hall
located('dining table', 'dining hall').
located('candle holder', 'dining table').
located('candle', 'candle holder').

%bedroom
located(hanger, bedroom).
located('red coat', hanger).
located('main entrance key', 'red coat').

%bathroom
located(toilet, bathroom).
located('victorian plunger'. toilet).

%trophy room
located('loaded crossbow', 'trophy room').
located('wolf trophy head', 'trophy room').

located('round table', 'living room').
located('key', 'round table').
:- op(35, xfy, located).


%contained checks recursively if something is located somewhere.
contained(T1, T1) :- room(T1).
contained(T1, T2) :- located(T1, T2).
contained(T1, T2) :- located(T1, X), contained(X, T2).
:- op(35, xfx, contained).
