last1(Item, List) :-
    conc(_, [Item], List).

% with conc 
conc([], L, L).
conc([X|L1], L2, [X|L3]) :-
    conc(L1, L2, L3).

goal1(L1, L) :- conc(L1, [_, _, _], L).
goal2(L2, L) :- conc([ _ , _ | L2],[_,_],L).