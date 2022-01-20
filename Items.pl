% items
thing('main entrance key').
thing('big sword').
thing('spoon').
thing('loaded crossbow').
thing('unloaded crossbow').
thing('arrow').
thing('wolf head trophy').
thing('torch').
thing('cloth').
thing('oil').
thing('candle holder').
thing('broom').
thing('victorian plunger').
thing('page1').
thing('page2').
thing('page3').
thing('page4').
thing('page5').
thing('red book').
%pages
page('page1').
page('page2').
page('page3').
page('page4').
page('page5').

%located(Something, Somewhere).

%main entrance
located('page1','main entrance').

%kitchen
located('kitchen table', kitchen).
located(cupboard, kitchen).
located(oil, cupboard).
located(cloth, 'kitchen table').
located(broom, kitchen).
located('page3', 'kitchen').

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
located('victorian plunger', toilet).

%trophy room
located('loaded crossbow', 'trophy room').
located('wolf trophy head', 'trophy room').

%living room 
located('big sword', 'living room').
located('round table', 'living room').
located('page2', 'round table').

%library
located('red book', 'library').
located('bureau', 'library').
located('page4', 'bureau').
located('maid room key', 'bureau').

%maid room 
located('corpse', 'maid room').
located('page5', 'corpse').
located('spoon', 'maid room').
:- op(35, xfy, located).


%contained checks recursively if something is located somewhere.
contained(T1, T1) :- room(T1).
contained(T1, T2) :- located(T1, T2).
contained(T1, T2) :- located(T1, X), contained(X, T2).
:- op(35, xfx, contained).
