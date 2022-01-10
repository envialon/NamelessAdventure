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


%located(Something, Somewhere).
located('round table', 'living room').
located('key', 'round table').
:- op(35, xfy, located).


%contained checks recursively if something is located somewhere.
contained(T1, T1) :- room(T1).
contained(T1, T2) :- located(T1, T2).
contained(T1, T2) :- located(T1, X), contained(X, T2).
:- op(35, xfx, contained).
