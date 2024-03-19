%line(point(X1, Y1), point(X2, Y2)).
vertical(point(X, Y1), point(X, Y2)) :- Y1 =\= Y2.
horizontal(point(X1, Y), point(X2, Y)) :- X1 =\= X2.
%rectangle(point(X1, Y1), point(X2, Y2), point(X3, Y3), point(X4, Y4)).

regular(rectangle(A,B,C,D)) :-
    (   vertical(A,B)
    ->  horizontal(B,C),
        vertical(C,D),
        horizontal(D,A)
    ;   horizontal(A,B),
        vertical(B,C),
        horizontal(C,D),
        vertical(D,A)
    ).

