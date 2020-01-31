-- SOAL LIVE CODING BASIS DATA
--          MATERI SQL

-- 1 buat database gagas_RPL_28
create database gagas_RPL_28;

-- 2 create table siswa
create table siswa(
    nis varchar(100) not null,
    nama varchar(200),
    id_kelas varchar(10),
    primary key(nis)
);
-- 3 create table kelas
create table kelas(
    kode_kelas varchar(20) not null,
    nama_mapel varchar(200),
    primary key(kode_kelas)
);
-- 4 create table mapel
create table mapel(
    kode_mapel varchar(20) not null,
    nama_mapel varchar(200),
    primary key(kode_mapel)
);
-- 5 create table guru
create table guru(
    id_guru varchar(20) not null,
    nama_guru varchar(300)
    primary key(id_guru)
);
-- 6 create table kbm
create table kbm(
    kode_mapel varchar(20),
    kode_mapel varchar(20),
    id_guru varchar(20)
);
-- 7 create table nilai
create table nilai(
    nis varchar(20),
    kode_mapel varchar(20),
    id_guru varchar(20),
    nilai double
);
-- 8 ** TAMBAH kkm table
alter table mapel
    add kkm double;
-- 9 ** MENGUBAH id_kelas > kode_kelas (siswa)
alter table siswa
    change id_kelas kode_kelas varchar(20);
-- 10 ** MENGHAPUS id_guru di tabel nilai
alter table nilai
    drop column id_guru;
-- 11 insert into siswa
insert into siswa
    values
    ('111','Ana Putri','XR2'),
    ('112','Annisa Rachmawati','XR2'),
    ('113','Alipah Nurhidayati','XR1'),
    ('114','Agwin Adi Pranata','XR1'),
    ('115','Abdul Widodo','XR3'),
    ('116','Darmo Joyo','XR3'),
    ('117','Rosidatul Maghfiroh','XR4'),
    ('118','Salwatul','XR4'),
    ('119','Widya Yunitha','XR5'),
    ('120','Yudhawan Anis','XR5');
-- 12 insert into kelas
insert into kelas
    values
    ('XR1','X RPL 1'),
    ('XR2','X RPL 2'),
    ('XR3','X RPL 3'),
    ('XR4','X RPL 4'),
    ('XR5','X RPL 5');
-- 13 insert into mapel
insert into mapel
    values
    ('BIG','Bahasa Inggris','80'),
    ('BIN','Bahasa Indoneisa','80'),
    ('KIM','Bahasa Kimia','70'),
    ('MTK', 'Matematika','75'),
    ('PKN','Bahasa Pendidikan Kewarganegaraan','75'),
    ('SI','Sejarah Indonesia','78');
-- 14 insert into guru
insert into guru
    values
    ('001','Shelvy Fitria'),
    ('002','Siti Kurniawati'),
    ('003','Ukhty Aulia');
-- 15 insert into kbm
insert into kbm
    values
    ('KIM','XR4','002'),
    ('MTK','XR4','001'),
    ('MTK','XR3','001'),
    ('MTK','XR2','001'),
    ('MTK','XR1','001'),
    ('MTK','XR5','001'),
    ('BIN','XR5','003'),
    ('BIN','XR4','003'),
    ('BIG','XR5','003'),
    ('SI','XR4','001'),
    ('SI','XR5','001'),
    ('KIM','XR1','002'),
    ('KIM','XR2','002');
-- 16 insert into nilai
insert into nilai
    values
    ('111','KIM','90'),
    ('112','KIM','60'),
    ('113','KIM','60'),
    ('114','KIM','75'),
    ('113','MTK','85'),
    ('114','MTK','70'),
    ('115','MTK','76'),
    ('118','MTK','80'),
    ('120','MTK','98'),
    ('111','MTK','76'),
    ('111','SI','90'),
    ('112','SI','75'),
    ('112','BIN','60'),
    ('111','BIN','70'),
    ('117','BIN','70');
-- 17 tampil kode_kelas, nama_kelas, nama_mapel (kimia)
select kelas.*, mapel.nama_mapel
    from kelas inner join kbm
    on kelas.kode_kelas = kbm.kode_kelas
    inner join mapel
    on kbm.kode_mapel = mapel.kode_mapel
    where mapel.nama_mapel like '%Kimia%';
-- 18 nilai dibawah kkm (matematika)
select siswa.nis, siswa.nama, mapel.nama_mapel, mapel.kkm, nilai.nilai
    from siswa inner join nilai
    on siswa.nis = nilai.nis
    inner join mapel
    on nilai.kode_mapel = mapel.kode_mapel
    where nama_mapel like '%Matematika'
    and nilai.nilai < mapel.kkm;
-- 19 jumlah siswa dibawah kkm
select kode_mapel, nama_mapel, count(siswa.nama) as jumlah
    from siwa inner join nilai
    on siswa.nis = nilai.nis
    inner join mapel
    on nilai.kode_mapel = mapel.kode_mapel;
-- 20 Tampilin nilai setiap mapel 'Ana Putri' 
select 