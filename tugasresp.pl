% Soal No 1
fib(0, 0).
fib(1, 1).
fib(N, F) :-
        N > 1,
        N1 is N-1,
        N2 is N-2,
        fib(N1, F1),
        fib(N2, F2),
        F is F1+F2.

%Soal No 2
% gcd( X, X, X).
% gcd( X, Y, D) :- X<Y, Y1 is Y-X, gcd( X, Y1, D).
% gcd( X, Y, D) :- Y<X, gcd( Y, X, D).

% euclid(A, 0, Z) :- Z is A.
% euclid(A, B, Z) :- B > A, euclid(B, A, Z).
% euclid(A, B, Z) :- X is A mod B, euclid(B, X, Z).
% gcd(A, B, Z) :- euclid(A, B, Z).

gcd(X, 0, X).
gcd(X, Y, D) :- Y > 0, Z is X mod Y, gcd(Y, Z, D).


% Soal No 3




