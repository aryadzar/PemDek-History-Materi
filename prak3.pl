% factorial(0,1).

% factorial(N,F) :- N > 0, N1 is N - 1, factorial(N1, F1), F is N*F1.

% sum_range(_,_, 0) :- !.
% sum_range(X,Y,R) :- X <= Y, Next is X + 1, sum_range(F1, Y, Sum), R is X + Sum.

% Base case: Sum of an empty range is 0

sum_range(X,X,X).
sum_range(X,Y,R) :- Y >X , Y1 is Y - 1, sum_range(X, Y1, Sum), R is Y + Sum.