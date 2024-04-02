del(_, [],[]).
del(L, [L|T], T1) :- del(L, T, T1).
del(L, [H|Y], [H|Y1]):-L \= H, del(L, Y, Y1).

del1(X, [X| T1], T1).
del1(X, [Y|T], [Y| T1]) :- del1(X, T, T1).