persegi_panjang(Titik1, Titik2, Titik3, Titik4) :-
  jarak(Titik1, Titik2, Jarak12),
  jarak(Titik1, Titik3, Jarak13),
  jarak(Titik1, Titik4, Jarak14),
  jarak(Titik2, Titik3, Jarak23),
  jarak(Titik2, Titik4, Jarak24),
  jarak(Titik3, Titik4, Jarak34),

  /* Kondisi panjang sisi berlawanan sama */
  sama(Jarak12, Jarak34),
  sama(Jarak13, Jarak24),

  /* Periksa sudut siku-siku menggunakan teorema Pythagoras */
  teorema_pythagoras(Jarak12, Jarak13, Jarak23),
  teorema_pythagoras(Jarak12, Jarak14, Jarak24),
  teorema_pythagoras(Jarak13, Jarak14, Jarak34).

jarak((X1, Y1), (X2, Y2), Jarak) :-
  Jarak is sqrt((X2 - X1)^2 + (Y2 - Y1)^2).

sama(A, B) :-
  A = B.

teorema_pythagoras(Sisi1, Sisi2, SisiMiring) :-
  SisiMiring^2 is Sisi1^2 + Sisi2^2.

/* Contoh penggunaan */
titik(1, 2).
titik(5, 2).
titik(5, 6).
titik(1, 6).

persegi_panjang(Titik1, Titik2, Titik3, Titik4).
