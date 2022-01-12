:- include('Movement.pl').
:- include('Inventory.pl').
:- include('Inspection.pl').
:- include('Items.pl').
:- include('Puzzles.pl').
:- include('Grammar.pl').
:- include('OtherActions.pl').
%stating all dynamic predicates
:- dynamic here/1.
:- dynamic located/2.
:- dynamic inventory/1.
:- dynamic door/3.
:- dynamic trapdoor/3.

%list utilities
add(X, L, [X|L]).

delete(_, [], []).
delete(X, [X|T], T).
delete(X, [H|T], [H|Z]) :- delete(X, T, Z).


loop :-
        repeat,
        get_input(InputList), 
        parse_command(InputList, OutputList),
        execute(OutputList),
        check_if_game_ends(OutputList), !.

get_input(InputList) :-       
        nl,
	read_line_to_codes(user_input, UserSentenceASCIICodes),
	string_to_atom(UserSentenceASCIICodes, Atom),
	atomic_list_concat(InputList,' ',Atom), 
        nl, nl, !.

parse_command(InputList, OutputList) :-
        nlp_transformation(OutputList, InputList, []), !.


execute([end]) :- !.
execute(OutputList) :-
        %operator =.. takes the head of the list as a functor and 
        %the rest of the arguments as args of said functor.
        Command =.. OutputList,
        call(Command), !.
execute(_) :- write('Try to make sense please.').

check_if_game_ends(_) :-        here('outside'), wearing('wolf trophy head'), 
                                write('You walk outside looking like an absolute clown wearing that wolf head,'), nl, 
                                write('while walking away form the house, heading to the distant town,'), nl, 
                                write('you can''t help but feel that there''s something more to that mansion...').

check_if_game_ends(InputList) :-
        [end|_] = InputList, !.
