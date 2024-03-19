%facts
dosen(favorisen, deklaratif).
dosen(shofiana, deklaratif).

asdos(john, deklaratif).
asdos(radit, deklaratif).

belajar(suntan, deklaratif).
belajar(hibatullah, deklaratif).
belajar(pandega, deklaratif).
belajar(muhadi, deklaratif).
belajar(susilo, deklaratif).

%rules
% mengajar(X,Y) :- dosen(X,Z), belajar(Y,Z).
% diajar(X,Y) :- belajar(X,Z), (dosen(Y,Z);asdos(Y,Z)); asdos(X,Z), dosen(Y,Z).
diajar(X,Y) :- belajar(X,Z); asdos(_,Z), dosen(Y,Z) ; asisten(Y,Z), X\==Y.
