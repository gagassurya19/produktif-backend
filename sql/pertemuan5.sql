-- TUGAS PRAKTIKUM --

-- NO 1
-- Buat user gagas_XRPL6_24 -> sebagai ROOT
-- masuk ke user root 
mysql -u root
-- membuat user baru
create user gagas_XRPL6_24@localhost identified by 'gagas';
-- membuat privilages agar user gagas_XRPL6_24 seperti ROOT
grant all on *.* to gagas_XRPL6_24@localhost;

-- NO 2
-- 
