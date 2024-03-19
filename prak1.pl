man(john).
woman(marry).
woman(janne).
woman(anissa).
loves(john, marry).
loves(marry, janne).

loves(X, Y) :- loves(Y,X).