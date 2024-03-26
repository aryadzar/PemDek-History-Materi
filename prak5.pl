% List Member
list_member(X,[X|_]).
list_member(X,[_|T]) :- list_member(X,T).

%list length
list_length([],0).
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.

