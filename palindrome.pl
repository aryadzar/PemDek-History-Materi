conc([], L, L).
conc([H|L1], L2, [H|L3] ):- conc(L1, L2, L3).

palin([]).
palin([_]).
palin(Pal) :- conc([H|T], [H], Pal), palin(T).
