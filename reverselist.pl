reverse(List, RL) :- reverse(List, [], RL).
reverse([], RL, RL).
reverse([H|T], Temp, RL) :- reverse(T, [H|Temp], RL).

