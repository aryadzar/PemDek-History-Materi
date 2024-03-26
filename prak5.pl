% List Member
list_member(X,[X|_]).
list_member(X,[_|T]) :- list_member(X,T).