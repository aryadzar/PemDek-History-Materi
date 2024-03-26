% List Member
list_member(X,[X|_]).
list_member(X,[_|T]) :- list_member(X,T).

%list length
list_length([],0).
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.

% list concat
list_concat([],L,L).
list_concat([X1|L1], L2, [X1|L3]) :- list_concat(L1,L2,L3).

% list delete
list_delete(X,[X],[]).
% list_delete(X, [X|L2], L1) :- list_delete(X,L2,L1 ).
list_delete(X, [X|L1], L1).
% list_delete(X, [Y|L2], [Y|L1]) :- X \= Y, list_delete(X,L2,L1).
list_delete(X, [Y|L2], [Y|L1]) :- list_delete(X,L2,L1).

%list append
list_append(A,T,T) :- list_member(A,T),!.
list_append(A,T,[A|T]).

% list insert
list_insert(X,L,R):- list_delete(X,R,L).

% odd or even
list_even_len([]).
list_odd_len([_]).
list_even_len([_|T]):- list_odd_len(T).
list_odd_len([_|T]) :- list_even_len(T).