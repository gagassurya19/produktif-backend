-- Mengurutkan barang dari harga terendah/paling murah
select KodeBarang, NamaBarang, Harga from jual_barang
    -> order by harga;

-- Mengurutkan Barang sesuai dengan stock <10
select NamaBarang, Stock, Harga from jual_barang           
    -> where Stock <10;

-- Jumlah mata kuliah 'Basis Data'
select count(nama_mk) as jumlah_bd                         
    -> from matakuliah
    -> where nama_mk like '%basis%data%';

-- Jumlah sks pada kode selain PTI
select sum(sks) as jumlah_sks
    -> from matakuliah
    -> where kode_mk not like '%PTI%';

-- Jumlah rata-rata penghasilan barang stock <50
select avg(harga) as ratarata_penghasilan
    -> from jual_barang
    -> where stock <50;

-- Jumlah harga barang yang harga >2000 dan stock <30;
select NamaBarang, Harga from jual_barang                  
    -> where KodeBarang not like '%BUK%'
    -> and Harga >2000 
    -> and Stock <30;

-- Jumlah nama matkul 'sistem'
select count(nama_mk) as jumlahNama                 
    -> from matakuliah
    -> where nama_mk like '%sistem%';