-- LATIHAN 3 --

-- no 1 RELATIONSHIP
-- buat tabel karyawan
create table karyawan( 
    nama varchar(30) not null, 
    id_dep int(20) not null 
)
-- input data karyawan
insert into karyawan(nama,id_dep)
    -> values
    -> ('Agus','10'),
    -> ('Budi','16'),
    -> ('Citra','12'),
    -> ('Dani','17');

-- buat table departemen
create table departemen(
    id_dep int(20) not null,
    nama_dep varchar(30) not null,
    primary key(id_dep)
)
-- input data departemen
insert into departemen(id_dep,nama_dep)
    -> values
    -> ('10','Penelitian'),
    -> ('11','Pemasaran'),
    -> ('12','SDM'),
    -> ('13','Keuangan');

-- no 2 INNER JOIN
-- Eksplisit
SELECT *
    FROM karyawan INNER JOIN departemen
    ON karyawan.id_dep = departemen.id_dep;
-- Implisit
SELECT * 
    FROM karyawan, departemen
    WHERE karyawan.id_dep = departemen.id_dep;
-- mengambil nama karyawan dan nama departemen yang
-- ditempatinya saja
SELECT karyawan.nama, departemen.nama_dep 
    FROM karyawan INNER JOIN departemen
    ON karyawan.id_dep = departemen.id_dep;
-- fitur derived table (Lebih Ringkas)
SELECT k.nama, d.nama_dep
    FROM karyawan k INNER JOIN departemen d 
    ON k.id_dep = d.id_dep;

-- no 3 OUTER JOIN
-- LEFT & RIGHT OUTER JOIN
-- contoh syntax Left Outer Join
SELECT *
    FROM karyawan k LEFT OUTER JOIN departemen d 
    ON k.id_dep = d.id_dep;
    -- Null muncul karena data pada tabel pertama tidak ada
    -- di tabel kedua
-- menggunakan klausa WHERE di dalam join
SELECT *
    FROM karyawan k LEFT OUTER JOIN departemen d 
    ON k.id_dep = d.id_dep
    WHERE d.id_dep IS NULL;
-- contoh syntax Right Outer Join
SELECT *
    FROM karyawan k RIGHT OUTER JOIN departemen d 
    ON k.id_dep = d.id_dep;
-- FULL OUTER JOIN
-- contoh syntax Full Outer Join
SELECT *
    FROM karyawan k LEFT OUTER JOIN departemen d 
    ON k.id_dep = d.id_dep
UNION SELECT *
    FROM karyawan k RIGHT OUTER JOIN departemen d 
    ON k.id_dep = d.id_dep;
-- CROS JOIN
-- contoh syntax Cross Join (EKSPLISIT)
SELECT *
    FROM karyawan CROSS JOIN departemen;
-- contoh syntax Cross Join (IMPLISIT)
SELECT * 
    FROM karyawan, departemen;

-- no 4 UNION
-- Buat tabel karyawan2
create table karyawan2(
    nama varchar(20) not null,
    id_dep int(10) not null,
    primari key(id_dep)
);
-- Input Data karyawan2
insert into karyawan2(nama,id_dep)
    values
    ('Dani','17'),
    ('Annisa','18'),
    ('Bagus','12'),
-- Penggabungan (UNION)
SELECT nama, id_dep
    FROM karyawan
UNION 
SELECT nama, id_dep
    FROM karyawan2;
-- Penggabungan (UNION ALL)
SELECT nama, id_dep
    FROM karyawan
UNION ALL 
SELECT nama, id_dep
    FROM karyawan2;
    -- Jika Menggunakan UNION data yang double 
    -- akan muncul satu kali.
    -- Jika menggunakan UNION ALL semua data 
    -- akan tampil, termasuk yang double.



-- TUGAS PRAKTIKUM --
-- buat tabel mahasiswa
create table mahasiswa(
    nim int(10) not null,
    nama varchar(20) not null,
    jenis_kelamin varchar(2) not null,
    alamat varchar(100),
    primary key(nim)
);
-- input data mahasiswa
insert into mahasiswa(nim,nama,jenis_kelamin,alamat)
    values
    ('101','Arif','L','Jl. Kenangan'),
    ('102','Budi','L','Jl. Jombang'),
    ('103','Wati','P','Jl. Surabaya'),
    ('104','Ika','P','Jl. Jombang'),
    ('105','Tono','L','Jl. Jakarta'),
    ('106','Iwan','L','Jl. Bandung'),
    ('107','Sari','P','Jl. Malang');

-- buat tabel ambil_mk
create table ambil_mk(
    nim int(10) not null,
    kode_mk varchar(20) not null,
    primary key(kode_mk)
);
-- input data ambil_mk
insert into ambil_mk(nim,kode_mk)
    values
    ('101','PTI447'),
    ('103','TIK333'),
    ('104','PTI333'),
    ('104','PTI777'),
    ('111','PTI123'),
    ('123','PTI999');

-- buat tabel matkul
create table matakuliah(
    kode_mk varchar(20) not null,
    nama_mk varchar(30) not null,
    sks int(5) not null,
    semester int(5) not null,
    primary key(kode_mk)
);
-- input data matkul
insert into matakuliah(kode_mk,nama_mk,sks,semester)
    values
    ('PTI447','Praktikum Basis Data','1','3'),
    ('TIK342','Praktikum Basis Data','1','3'),
    ('PTI333','Basis Data Terdistribusi','3','5'),
    ('TIK123','Jaringan Komputer','2','5'),
    ('TIK333','Sistem Operasi','3','5'),
    ('PTI123','Grafika Multimedia','3','5'),
    ('PTI777','Sistem Informasi','2','3');



-- EKSEKUSI

-- NO 1 
-- Eksplisit
select m.nim, m.nama
    from mahasiswa m inner join ambil_mk mk 
    on m.nim = mk.nim
    group by nama;
-- Implisit
select m.nim, m.nama
    from mahasiswa m, ambil_mk mk
    where m.nim = mk.ngagasim
    group by nama;

-- NO 2
select m.jenis_kelamin, count(jenis_kelamin) as jumlah
    from mahasiswa m left outer join ambil_mk mk
    on m.nim = mk.nim
    where mk.nim is null
    group by jenis_kelamin;

-- NO 3
-- EKSPLISIT
select m.nim, m.nama, mk.kode_mk, mt.nama_mk
    from mahasiswa m inner join ambil_mk mk 
        inner join matakuliah mt
    on m.nim = mk.nim
        and mk.kode_mk = mt.kode_mk
    where mk.kode_mk is not null
    group by nim;
-- IMPLISIT
select m.nim, m.nama, mk.kode_mk, mt.nama_mk
    from mahasiswa m, ambil_mk mk, matakuliah mt
    where m.nim = mk.nim
        and mk.kode_mk = mt.kode_mk
    group by nim;

-- NO 4
select m.nim, m.nama, sum(mt.sks) as jum_sks
    from mahasiswa m inner join ambil_mk mk
        inner join matakuliah mt
    on m.nim = mk.nim
        and mk.kode_mk = mt.kode_mk
    group by mk.nim
    having jum_sks between 4 and 10;

-- NO 5
select mt.*
    from mahasiswa m left outer join ambil_mk mk
    on m.nim = mk.nim right outer join matakuliah mt
    on mk.kode_mk = mt.kode_mk
    where mk.nim is null;




-- TUGAS RUMAH --

-- NO 1 Buat database
-- table instruktur
create table instruktur(
    nip int(10) not null,
    namains varchar(30) not null,
    jurusan varchar(30) not null,
    asalkota varchar(30) not null,
    primary key(nip)
);
-- input data instruktur
insert into instruktur(nip,namains,jurusan,asalkota)
    values
    ('1','Steve Wozniak','Ilmu Komputer','Bantul'),
    ('2','Steve Jobs','Seni Rupa','Solo'),
    ('3','James Gosling','Ilmu Komputer','Klaten'),
    ('4','Bill Gates','Ilmu Komputer','Magelang');
-- buat table matakuliah
create table matakuliah(
    nomk varchar(10) not null,
    namamk varchar(30) not null,
    sks int(10) not null,
    primary key(nomk)
);
-- input data matakuliah
insert into matakuliah(nomk,namamk,sks)
    values
    ('KOM101','Algoritma dan Pemrograman','3'),
    ('KOM102','Basis Data','3'),
    ('KOM201','Pemrograman Berorientasi Objek','3'),
    ('SR101','Desain Elementer','3');
-- buat table kuliah
create table kuliah(
    nip int(10) not null,
    nomk varchar(10) not null,
    ruangan int(10) not null,
    jmlmhs int(10) not null,
    primary key(nomk)
);
-- insert data table kuliah
insert into kuliah(nip,nomk,ruangan,jmlmhs)
    values
    ('1','KOM101','101','50'),
    ('1','KOM102','102','35'),
    ('2','SR101','101','45'),
    ('3','KOM201','101','55');

-- A Nomor dan Mata kuliah peserta lebih 40 org.
select 




