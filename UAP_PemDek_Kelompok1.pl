% % Fakta tentang gejala penyakit kulit
% gejala(gatal).
% gejala(kulit_bersisik).
% gejala(kulit_kering).
% gejala(kulit_menebal).
% gejala(kulit_pecah_pecah).
% gejala(pembengkakan_pada_kulit).
% gejala(timbul_bercak_merah_yang_ditutupi_sisa_kulit_sel_sebelumnya).
% gejala(timbul_bintik_kecil).
% gejala(demam).
% gejala(ruam_menyerupai_cincin).
% gejala(ruam_pada_kulit).
% gejala(bercak_putih).

% % Fakta tentang penyakit kulit
% penyakit(psoriasis) :- 
%     gejala(gatal), 
%     gejala(kulit_bersisik), 
%     gejala(kulit_kering), 
%     gejala(kulit_menebal), 
%     gejala(kulit_pecah_pecah), 
%     gejala(pembengkakan_pada_kulit), 
%     gejala(timbul_bercak_merah_yang_ditutupi_sisa_kulit_sel_sebelumnya), 
%     gejala(timbul_bintik_kecil). 

% penyakit(kurap) :-
%     gejala(kulit_bersisik),
%     gejala(demam),
%     gejala(ruam_menyerupai_cincin),
%     gejala(ruam_pada_kulit).

% penyakit(panu) :-
%     gejala(bercak_putih),
%     gejala(gatal),
%     gejala(kulit_bersisik),
%     gejala(kulit_kering),
%     gejala(kulit_menebal).

:- dynamic penyakit/1.
:- dynamic gejala/3.
:- dynamic yes/2.
:- dynamic no/1.

% Daftar penyakit
penyakit("Kurap").
penyakit("Psoriasis").
penyakit("Panu").

% Fakta gejala dengan nilai keyakinan untuk setiap penyakit
gejala("Kurap", "Apakah anda memiliki ruam menyerupai cincin?", 0.6).
gejala("Kurap", "Apakah anda memiliki kulit yang bersisik?", 0.7).
gejala("Kurap", "Apakah anda mengalami demam?", 0.8).
gejala("Kurap", "Apakah anda memiliki ruam pada kulit?", 0.6).

gejala("Psoriasis", "Apakah anda merasakan gatal-gatal pada kulit?", 0.8).
gejala("Psoriasis", "Apakah anda memiliki kulit yang bersisik?", 0.7).
gejala("Psoriasis", "Apakah anda memiliki kulit yang menebal?", 0.6).
gejala("Psoriasis", "Apakah anda memiliki kulit yang pecah-pecah", 0.5).
gejala("Psoriasis", "Apakah anda memiliki pembengkakan pada kulit", 0.7).
gejala("Psoriasis", "Apakah kulit anda timbul bercak merah yang ditutupi sisa kulit sel sebelumnya", 0.5).
gejala("Psoriasis", "Apakah kulit anda timbul bintik kecil", 0.8).

gejala("Panu", "Apakah anda memiliki bercak putih di kulit?", 0.7).
gejala("Panu", "Apakah anda mengalami gatal-gatal pada kulit?", 0.6).
gejala("Panu", "Apakah anda merasakan gatal di kulit?", 0.7).
gejala("Panu", "Apakah kulit anda bersisik?", 0.5).
gejala("Panu", "Apakah kulit anda kering?", 0.7).

% Fakta untuk mengkonversi jawaban pengguna menjadi nilai keyakinan
konversi_nilai_keyakinan(0, 0).
konversi_nilai_keyakinan(1, 0.25).
konversi_nilai_keyakinan(2, 0.5).
konversi_nilai_keyakinan(3, 0.75).
konversi_nilai_keyakinan(4, 1).

% Fungsi untuk mengajukan pertanyaan
pertanyaan(Penyakit, Pertanyaan, NilaiKeyakinanSistem) :-
    write(Pertanyaan), nl,
    write('Pilih tingkat keyakinan Anda (0: Tidak Yakin, 1: Kurang Yakin, 2: Cukup Yakin, 3: Yakin, 4: Sangat Yakin): '), nl,
    read(NilaiKeyakinanPengguna),
    (   integer(NilaiKeyakinanPengguna),
        NilaiKeyakinanPengguna >= 0, NilaiKeyakinanPengguna =< 4
    ->  proses_respon(NilaiKeyakinanPengguna, Penyakit, NilaiKeyakinanSistem)
    ;   write('Jawaban tidak valid. Mohon berikan nilai antara 0 dan 4.'), nl,
        pertanyaan(Penyakit, Pertanyaan, NilaiKeyakinanSistem)
    ).

% Fungsi untuk memproses jawaban pengguna
proses_respon(NilaiKeyakinanPengguna, Penyakit, NilaiKeyakinanSistem) :-
    konversi_nilai_keyakinan(NilaiKeyakinanPengguna, NilaiKeyakinan),
    NilaiKeyakinanGejala is NilaiKeyakinan * NilaiKeyakinanSistem,
    update_confidence(Penyakit, NilaiKeyakinanGejala).

% Fungsi untuk memperbarui keyakinan
update_confidence(Penyakit, NilaiKeyakinanGejala) :-
    (   yes(Penyakit, NilaiKeyakinanLama)
    ->  retract(yes(Penyakit, NilaiKeyakinanLama)),
        NKKombinasi is NilaiKeyakinanLama + NilaiKeyakinanGejala * (1 - NilaiKeyakinanLama),
        asserta(yes(Penyakit, NKKombinasi))
    ;   asserta(yes(Penyakit, NilaiKeyakinanGejala))
    ).

% Fungsi untuk menghitung tingkat keyakinan total untuk setiap penyakit.
hitung_keyakinan(Penyakit, Keyakinan) :-
    findall(C, yes(Penyakit, C), KeyakinanList),
    sum_list(KeyakinanList, Keyakinan).

% Fungsi untuk menemukan penyakit dengan tingkat keyakinan tertinggi
cari_penyakit_terbaik([Penyakit], (Penyakit, Keyakinan)) :-
    hitung_keyakinan(Penyakit, Keyakinan), !.
cari_penyakit_terbaik([Penyakit|Rest], (PenyakitTerbaik, KeyakinanTerbaik)) :-
    hitung_keyakinan(Penyakit, Keyakinan),
    cari_penyakit_terbaik(Rest, (PenyakitSaatIniTerbaik, KeyakinanTerbaikSaatIni)),
    (   Keyakinan =< KeyakinanTerbaikSaatIni
    ->  (PenyakitTerbaik, KeyakinanTerbaik) = (PenyakitSaatIniTerbaik, KeyakinanTerbaikSaatIni)
    ;   (PenyakitTerbaik, KeyakinanTerbaik) = (Penyakit, Keyakinan)
    ).
cari_penyakit_terbaik([], (none, 0)).

% Fungsi untuk menampilkan hasil diagnosa
hasil_diagnosa :-
    findall(Penyakit, (yes(Penyakit, _)), PenyakitList),
    list_to_set(PenyakitList, PenyakitUnik),
    cari_penyakit_terbaik(PenyakitUnik, (PenyakitTerbaik, NilaiKeyakinanTerbaik)),
    (   PenyakitTerbaik \= none
    ->  PersentaseKeyakinan is NilaiKeyakinanTerbaik * 100,
        write('Pasien kemungkinan menderita: '), write(PenyakitTerbaik), write(' dengan kemungkinan: '), write(PersentaseKeyakinan), write(' %'), nl
    ;   write('Maaf, saya tidak dapat membuat diagnosis.'), nl
    ),
    retractall(yes(_, _)),
    retractall(no(_)).  

% Rule untuk mencari penyakit berdasarkan gejala yang diberikan
temukan_penyakit :-
    retractall(yes(_, _)),
    retractall(no(_)),
    diagnosa.

% Rule untuk melakukan diagnosa berdasarkan gejala-gejala
diagnosa :-
    penyakit(Penyakit),
    gejala(Penyakit, Pertanyaan, NilaiKeyakinanSistem),
    pertanyaan(Penyakit, Pertanyaan, NilaiKeyakinanSistem),
    fail.
    diagnosa.



