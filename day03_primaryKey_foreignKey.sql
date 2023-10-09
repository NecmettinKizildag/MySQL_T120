/*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur. 
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.
-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);
2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);
================================================================================================*/

USE sys;

CREATE TABLE sehirler(
alan_kodu INT PRIMARY KEY,
isim VARCHAR(20),
nufus INT
);

SELECT*FROM sehirler;

/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin. 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/

CREATE TABLE ogretmenler(
id INT UNIQUE,
isim VARCHAR(20),
brans VARCHAR(20),
cinsiyet VARCHAR(10),
CONSTRAINT id_isim PRIMARY KEY (id,isim)
); 
SELECT*FROM ogretmenler;

/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/

CREATE TABLE universite_ogrenci_bilgi_sistemi(
giris_yili YEAR,
giris_siralamasi INT,
isim VARCHAR (30) NOT NULL,
bolum VARCHAR(20),
CONSTRAINT pk PRIMARY KEY(giris_yili,giris_siralamasi)
);

SELECT*FROM universite_ogrenci_bilgi_sistemi;

/*====================================== FOREIGN KEY ==============================================
=> Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir. 
=> Foreign Key baska bir tablonun Primary Key'ine baglidir. 
=> Referenced table (baglanilan tablo, Primary Key'in oldugu Tablo) parent table olarak adlandirilir. 
   Foreign Key'in oldugu tablo ise child table olarak adlandirilir. 
=> Bir Tabloda birden fazla Foreign Key olabilir. 
=> Foreign Key NULL degeri alabilir. 
=> Foreign Key duplicate olabilir. 
Note 1: "Parent Table"da olmayan bir id'ye sahip datayi "Child Table"'a ekleyemezsiniz .
Note 2: Child Table'i silmeden Parent Table'i silemezsiniz. Once "Child Table" silinir,
        sonra "Parent Table" silinir.
        
-----Syntax-----
CONSTRAINT constraintName FOREIGN KEY(table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
CREATE TABLE table_name
(
id char(10),
name char(10),
CONSTRAINT constraint_name 
FOREIGN KEY (table_name_id) 
REFERENCES parent_table (parent_table_field_name) 
);
        
==================================================================================================*/


/*------------------------------------------------------------------------
"tedarikci" isimli bir tablo olusturun. 
Tabloda "tedarikci_id", "tedarikci_ismi", "iletisim_isim" field'lari olsun 
ve "tedarikci_id" yi Primary Key yapin.
 "urunler" isminde baska bir tablo olusturun "tedarikci_id" ve "urun_id"
 field'lari olsun ve "tedarikci_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/

CREATE TABLE tedarikci (
tedarikci_id VARCHAR (20) PRIMARY KEY,
tedarikci_ismi VARCHAR (20),
iletisim_isim VARCHAR (20)
);

CREATE TABLE urunler (
tedarikci_id VARCHAR(20),
urun_id VARCHAR(20),
CONSTRAINT tedarikci_id_FK FOREIGN KEY(tedarikci_id) 
REFERENCES tedarikci (tedarikci_id) 
);

/*------------------------------------------------------------------------
"bebeler" isimli bir tablo olusturun. 
Tabloda "id", "isim", "iletisim" field'lari olsun 
ve "id" yi Primary Key yapin.
 "notlar" isminde baska bir tablo olusturun "bebe_id" ve "puan"
 field'lari olsun ve "bebe_id" yi Foreign Key yapin.
---------------------------------------------------------------------------*/

CREATE TABLE bebeler(
id INT PRIMARY KEY,
isim VARCHAR(30),
iletisim VARCHAR(30)
);

CREATE TABLE notlar(
bebe_id INT,
puan DOUBLE,
CONSTRAINT bebe_id_FK FOREIGN KEY(bebe_id) 
REFERENCES bebeler (id) 
); 
SELECT*FROM bebeler;
SELECT*FROM notlar;
