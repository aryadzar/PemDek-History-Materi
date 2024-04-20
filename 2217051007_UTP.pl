%no 1
% 3 baris awal adalah sebuah base case jika kosong maka 0 jawabannya, jika 
% salah satu list ada isinya maka hasilnya adalah 1
count([],[],0).
count([_],[],1).
count([],[_],1).
% menjumlahkan tiap list jika salat satu list ada isinya dengan menggunakan rekursif
count([_|T],[],R) :- count(T,[], RTemp),R is RTemp +1.
count([],[_|T],R) :- count([],T, RTemp), R is RTemp +1.
% jika list ada isinya dua duanya maka akan melakukan rekursif masing masing kedua list dan memproses bagiannya dari masing masing functor base case 4 dan 5
count([_|T1], [_|T2], R) :- count(T1,T2, RTemp), R is RTemp +1.



%no 2
%soal multiply
%kita buat base casenya, jika list kosong, maka hasilnya adalah 0
multiply([], 0).
% jika list ada satu anggota, maka hasilnya adalah anggota itu sendiri
multiply([X], X).
%jika sebuah list lebih dari satu, maka akan dilakukan rekursif sampai dengan rule yang kedua, maka 
%akan dikalikan dari elemen list yang terakhir sampai paling awal karena sesuai dengan list yang direkursifkan
multiply([H|T], R):- multiply(T, Sub), R is H * Sub.


%no 3
% soal palindrome
%saya mendefinisikan sebuah conc yang berfungsi sebagai penggabungan yang akan digunakan pada functor palindrome
conc([], L, L).
conc([H|L1], L2, [H|L3] ):- conc(L1, L2, L3).
%base case dari sebuah palindrome adalah sebuah list kosong
palindrome([]).
%jika sebuah palindrome ada isinya tanpa peduli isinya apa dengan mengguanakan anonymous variable,maka nilainya menjadi true
palindrome([_]).
%jika sebuah palindrome lebih dari satu anggota dari sebuah list, maka
%akan mengecek apakah dari sebuah list yang akan dikatakan sebagai palindrome memiliki 
% head yang sama dengan akhirnya makanya dipakai conc untuk mengecek akhir dan awal dari sebuah list
%jika true, maka tailnya akan dicek lagi dengan menggunakan rekursif dengan base case di atas
palindrome(Pal) :- conc([H|T], [H], Pal), palindrome(T).




%no 4
% gunakan functor bawaan dari prolog dengan menggunakan sort, maka akan otomatis
% menghapus element yang double munculnya
duplicates_remove(List, Sorted) :- sort(List, Sorted).



%no 5
count_occurrences(_ ,[] ,0). %untuk list kosong, apapun testnya pasti 0
% kita melakukan recursive sampai dengan basecase jika elemntnya element pertama sama dengan head dari sebuah list
count_occurrences(H , [H|T],R):-
    count_occurrences(H,T,R1),
    R is R1 +1.
%Jika ada element yang berbeda, maka menggunakan dif sebagai pembeda supaya dihitung dari awal hingga akhir 
count_occurrences(H2 , [H|T],Count):-
    dif(H2,H), % sama aja dengan H2 \== H
    count_occurrences(H2,T,Count).




