:- include('Movement.pl').
:- include('Inventory.pl').
:- include('Inspection.pl').
:- include('Items.pl').
:- include('Puzzles.pl').
:- include('Grammar.pl').

%stating all dynamic predicates
:- dynamic here/1.
:- dynamic located/2.
:- dynamic inventory/1.

%help message that displays the possible actions:
help :- 
        write('The available actions are: '), nl, nl,
        tab(2), write('goto: you can move through the different rooms! how cool is that?'), nl,
        tab(6), write('example: goto ''living room''.'), nl, nl, 
        tab(2), write('look: you can look around the room! by looking around you can get new clues!'), nl,
        tab(6), write('example: look.'), nl, nl, 
        tab(2), write('take: take whatever you want, don''t be shy, no one will miss it ;)'), nl,
        tab(6), write('example: take ''delicious treat''.'), nl, nl, 
        tab(2), write('put: you can leave stuff if you''re feeling generous too.'), nl,
        tab(2), write('If you don''t specify where you want to place the item, you''ll drop it on the floor.'), nl,
        tab(6), write('example: put ''very valuable item'' ''cabinet''.    This will put the very valuable item in the cabinet'), nl, nl, 
        tab(2), write('look_inventory: do I really need to explain what this one does?'), nl,
        tab(6), write('example: look_inventory.'), nl, nl 
        .

loop :-
        repeat,
        get_input(InputList), 
        parse_command(InputList, OutputList),
        execute(OutputList),
        check_if_game_ends(OutputList), !.

get_input(InputList) :-
        %ansi_format([bold, fg(green)], '[~w@ship]# ', ['Jolly-Roger']),
	read_line_to_codes(user_input, UserSentenceASCIICodes),
	string_to_atom(UserSentenceASCIICodes, Atom),
	atomic_list_concat(InputList,' ',Atom), !.

parse_command(InputList, OutputList) :-
        nlp_transformation(OutputList, InputList, []), !.


execute([end]) :- !.
execute(OutputList) :-
        %operator =.. takes the head of the list as a functor and 
        %the rest of the arguments as args of said functor.
        Command =.. OutputList,
        call(Command), !.
execute(_) :- write('Try to make sense please, type help if you want to check examples.').


check_if_game_ends(InputList) :-
        [end|_] = InputList, !.
