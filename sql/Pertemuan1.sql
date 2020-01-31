-- TugasPraktikum 1 --
create databases tugasPraktikum1;

-- Membuat Database tugasPraktikum1_1 
-- Membuat Table Barang
create table barang(
    id_barang int(8) not null,
    nama_barang varchar(20) not null,
    harga int(11),
    primary key(id_barang);

-- Insert Data Barang
insert into barang(id_barang, nama_barang, harga) 
    values  
    (001, 'macbook pro', 5000);


-- tugasPraktikum1_2
-- mencari matkul yang jumlah sks+semester = 4
select * from matakuliah
    where sks+semester like 4;

-- tugasPraktikum1_3
-- Mencari matkul yang tidak ada nama 'Praktikum' dan sks berjumlah 3
select * from matakuliah
    where nama_mk not like '%praktikum'
    and sks like 3;




-- Tugas Praktikum 2 --
create database tugasPraktikum2;

-- tugasPraktikum2_1
-- Membuat DataBase daftar_pegawai
create table daftar_pegawai(
    id_pegawai int(10),
    nama varchar(20),
    jk varchar(2),
    th_masuk int(4),
    alamat varchar(10),
    primary key(id_pegawai)
)

-- Mengisi data Pegawai
insert into daftar_pegawai(id_pegawai,nama,jk,th_masuk,alamat)
    values 
    (123,'Muhammad Cahyo','L',2012,'Malang'),
    (124,'Dewi Kusuma','P',2010,'Kediri'),
    (125,'Rafif Daniswara','L',2013,'Pasuruan'),
    (126,'Muhammad Alfian','L',2009,'Malang'),
    (127,'Fitriani Ari','P',2010,'Surabaya'),
    (128,'Rizal Abidin','L',2012,'Malang');

-- sorting data menurut jenis kelamin dan nama alamat
select * from daftar_pegawai
    where alamat like '%malang'
    and jk like '%l';

-- sorting data menurut kelamin laki-laki dan tahun >2010
select * from daftar_pegawai                                              
    where jk like '%l'
    and th_masuk >2010;

-- sorting data menurut alamat 'malang' dan masuk <2012
select * from daftar_pegawai                                       
    where alamat like '%malang'
    and th_masuk <2012;

-- Pencapaian dalam memahami SQL yaitu 90%