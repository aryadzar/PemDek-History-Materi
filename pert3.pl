last1(Item, List) :-
    conc(_, [Item], List).

%with conc 
conc([], L, L).
conc([X|L1], L2, [X|L3]) :-
    conc(L1, L2, L3).

