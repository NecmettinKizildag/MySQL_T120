/*==================================SELECT-WHERE=============================================
Verileri SELECT komutu ile veritabanindan cekerken filtreleme yapmak icin : 
 
SELECT ile birlikte WHERE komutu kullanilabilir.
-----Syntax----- :
SELECT field1, field2 
FROM tablo_adi 
WHERE kosul;
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
=========================================================================================*/

CREATE TABLE meslek_lisesi 
(
okul_no CHAR(4) UNIQUE,
isim VARCHAR(50) NOT NULL,
derece DOUBLE,
adres VARCHAR(100),
son_degisiklik_tarihi DATE
);

SELECT * FROM meslek_lisesi; -- * Tumu veye Hepsi anlamlarina gelir.

INSERT INTO meslek_lisesi VALUES('1001','Fatih Oz', 89,'Ankara', '2022-11-23');      
INSERT INTO meslek_lisesi VALUES('1002','Fatih Yildiz', 94,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1003','Bora Sverige', 78,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1004','Nevzat Celik', 69,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1005','Gursel Unal', 90,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1006','Soner Karatasoglu ', 85,'Istanbul', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1007','Talha Kurt', 75,'Ankara', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1008','Yakup Lejon', 79,'Izmir', '2022-11-23');
INSERT INTO meslek_lisesi VALUES('1009','Ilhan Gurbetci', 80,'Izmir', '2022-11-23');

-- Q1 : Derecesi 90'dan yuksek olan ogrencilerin tum bilgilerini getirin.

SELECT*					-- hangi bilgileri getirecegi(* tamami ya da hepsi demek)
FROM meslek_lisesi		-- hangi tablodan gelecegi
WHERE derece>90;		-- hangi kosulda gelecegi

SELECT isim					
FROM meslek_lisesi		
WHERE derece<80;

SELECT isim,derece					
FROM meslek_lisesi		
WHERE adres='Ankara';

-- Q4 : okul_no'su 1005 olan ogrencinin isim ve adres bilgisini listeleyin.

SELECT isim,adres					
FROM meslek_lisesi		
WHERE okul_no='1005';

-- Q5 : Derecesi 70 ile 80 arasinda olan ogrencilerin okul_no ve adreslerini listeleyin.

SELECT okul_no,adres					
FROM meslek_lisesi		
WHERE derece>70 && derece<80;

SELECT okul_no,adres					
FROM meslek_lisesi		
WHERE derece>70 AND derece<80;

SELECT okul_no,adres					
FROM meslek_lisesi		
WHERE derece>70 AND derece<80;

/*================================== SELECT-BETWEEN =============================================
BETWEEN iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla 
yazabilme imkani verir, yazdigimiz iki sinirda araliga dahildir.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name 
BETWEEN deger1 AND deger2;
=========================================================================================*/

SELECT okul_no,adres					
FROM meslek_lisesi		
WHERE derece
BETWEEN 70 and 80;

/*==========================AND (ve) Operatoru kullanimi==================================
=> And ile belirtilen sartlarin tamami gerceklesiyorsa o kayit listelenir,
Sartlardan bir tanesi bile tutmazsa listelenmez.

SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50

Bu ornekte hem sinav1 hem de sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.

/*==========================OR (veya) Operatoru kullanimi==================================
=> Or ile belirtilen sartlardan en az biri gerceklesiyorsa o kayit listelenir,
sartlardan hicbiri gerceklesmiyorsa o kayit listelenmez.

SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50

Bu ornekte sinav1 veya sinav2 field'i 50'den kucuk olan kayitlar listelenecektir.
=========================================================================================*/
USE sys;
-- *************************************************************************
CREATE TABLE ogretmen_lisesi(
id int,
isim VARCHAR(45),
adres VARCHAR(100),
sinav_notu DOUBLE
);

INSERT INTO ogretmen_lisesi VALUES (111, 'Emine Yucel', 'Ankara', 75);
INSERT INTO ogretmen_lisesi VALUES (112, 'Muhammet Talha Kurt', 'Istanbul', 85);
INSERT INTO ogretmen_lisesi VALUES (113, 'Ilhan Sahin', 'Ankara', 70);
INSERT INTO ogretmen_lisesi VALUES (114, 'Kadir Corumlu', 'Corum', 90);
INSERT INTO ogretmen_lisesi VALUES (115, 'Selman Kasabali', 'Ankara',70);
INSERT INTO ogretmen_lisesi VALUES (116, 'Murat Aycicek', 'Izmir', 85);
INSERT INTO ogretmen_lisesi VALUES (117, 'Tugba Ozsoy', 'Bolu', 85);

SELECT * FROM ogretmen_lisesi;
/*-------------------------------------------------------------------------
Q6: Sinav notu 70'ten buyuk 80'den kucuk olan ogrencilerin tum bilgilerini listeleyin.
---------------------------------------------------------------------------*/

-- ******************** 1. yontem *******************
SELECT *					
FROM ogretmen_lisesi	
WHERE sinav_notu>70 AND sinav_notu<80;

-- ******************** 2. yontem *******************
SELECT *					
FROM ogretmen_lisesi	
WHERE sinav_notu
BETWEEN 71 and 79; 	-- between kosulunda once kucuk olan degeri yazmaliyiz

SELECT isim					
FROM ogretmen_lisesi	
WHERE isim
BETWEEN 'Muhammet Talha' and 'Murat'; 

-- NOT : String ifadeleri BETWEEN komutu ile kiyaslamak istedigimizde bize
-- sonucu ASCII degerlerine gore siralayarak gonderir.

/*-------------------------------------------------------------------------
Q8: Esra ve Salih arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim					
FROM ogretmen_lisesi	
WHERE isim
BETWEEN 'Esra' and 'Salih';  

/*-------------------------------------------------------------------------
Q9: Ankara ile Corum adresleri arasinda olan ogrencilerin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim					
FROM ogretmen_lisesi	
WHERE adres
BETWEEN 'Ankara' and 'Corum'; 

CREATE TABLE personel(
id CHAR(5) UNIQUE,
isim VARCHAR(50),
maas INT
);

INSERT INTO personel VALUES('10001','Ahmet Aslan',7000);
INSERT INTO personel VALUES('10002','Mehmet Yilmaz',12000);
INSERT INTO personel VALUES('10003','Meryem',7215);
INSERT INTO personel VALUES('10004','Veli Han',5000); 
INSERT INTO personel VALUES('10005','Mustafa Ali',5500);
INSERT INTO personel VALUES('10006','Ayse Can',5600);
INSERT INTO personel VALUES('10010','Ayse',4700);
INSERT INTO personel VALUES('10009','Ayse Cemile',4000);
INSERT INTO personel VALUES('10008','Ayse Cano',4300);
INSERT INTO personel VALUES('10007','Can Ayse',7700);
INSERT INTO personel VALUES('10011','Yeliz Alina',12700);

SELECT*FROM personel;
/*-------------------------------------------------------------------------
Q10: id'si 10005 ile 10009 arasinda olan personelin bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT *				
FROM personel	
WHERE id
BETWEEN 10005 AND 10009; 

/*-------------------------------------------------------------------------
Q11: ismi Mehmet Yilmaz ile Veli arasinda olan personelin bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT *				
FROM personel	
WHERE isim
BETWEEN 'Mehmet Yilmaz' AND 'Veli';  

/*-------------------------------------------------------------------------
Q11: ismi Ahmet ile Ayse Cano arasinda olan personelin bilgilerini listeleyin.
---------------------------------------------------------------------------*/

SELECT *				
FROM personel	
WHERE isim
BETWEEN 'Ahmet' AND 'Ayse Cano';  

/*-------------------------------------------------------------------------
Q11: maasi 7000 ya da ismi Ayse olan personelin id'lerini listeleyin.
---------------------------------------------------------------------------*/

SELECT id				
FROM personel	
WHERE maas=7000 OR isim = 'Ayse'; 

/*-------------------------------------------------------------------------
Q11:id'si 10001, 10005 ya da 10008 olan personelin isimlerini listeleyin.
---------------------------------------------------------------------------*/

SELECT isim				
FROM personel	
WHERE id = 10001 or id=10005 or id=10008; 

/*================================== SELECT-IN ===========================================
IN birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla yazabilme
imkani verir. IN icerisine yazacagimiz sartlar ayni field'a ait olmali.
-----Syntax-----
SELECT field1,field2,...
FROM table_name
WHERE field_name IN (deger1,deger2,...);
=========================================================================================*/

SELECT isim				
FROM personel	
WHERE id IN(10001,10005,10008);

/*-------------------------------------------------------------------------
Q15: Maasi 7000 veya 12000 olan personelin bilgilerini listele
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE maas IN(7000,12000);

/*================================== SELECT-LIKE =============================================
LIKE keyword sorgulama yaparken belirli patternleri kullanabilmemize olanak saglar.
-----Syntax-----
 SELECT field1,field2,...
 FROM table_name
 WHERE field LIKE pattern
 
 ----------------
 Pattern icin :
 % ---> 0 veya daha fazla karakteri belirtir
 _ ---> Tek bir karakteri temsil eder.
=========================================================================================*/
 
/*-------------------------------------------------------------------------
Q16: Ismi A ile baslayan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT*
FROM personel
WHERE isim LIKE'a%';

/*-------------------------------------------------------------------------
Q17: Isminde Ayse iceren personelin isimlerini listeleyiniz
---------------------------------------------------------------------------*/
 
SELECT *
FROM personel
WHERE isim LIKE '%ayse%'; 


/*-------------------------------------------------------------------------
Q18: Ismi n harfi ile biten personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim LIKE '%n'; 

/*-------------------------------------------------------------------------
Q19: Isminin 2. harfi e olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim LIKE '_e%'; 

/*-------------------------------------------------------------------------
Q20: Isminin 2. harfi e olup diger harflerinde y olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim LIKE '_e%' AND isim LIKE '%y%'; 
 
/*-------------------------------------------------------------------------
Q21: Isminde a harfi olmayan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim NOT LIKE '%a%'; 

/*-------------------------------------------------------------------------
Q22: Maasi 5 haneli olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE maas LIKE '_____'; 

/*-------------------------------------------------------------------------
Q23: 1. harfi a ve 7. harfi a olan personeli listeleyiniz
---------------------------------------------------------------------------*/

SELECT *
FROM personel
WHERE isim LIKE 'a%' AND isim LIKE '______a%'; 

SELECT *
FROM personel
WHERE isim LIKE 'a_____a%'; 

/*==================================SELECT-REGEXP_LIKE==================================
 Daha karmasik pattern ile sorgulama islemi icin REGEXP_LIKE kullanilabilir.
  -- 'c' => case-sensitive demektir
  -- 'i' => case-insensitive demektir ve default case-insensitive aktiftir.
  
-----Syntax-----
 SELECT sutun1,sutun2,...
 FROM tablo_adi
 WHERE REGEXP_LIKE(sutun_adi, 'pattern[]','c'[])
=========================================================================================*/

CREATE TABLE kelimeler
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
INSERT INTO kelimeler VALUES 
(1001, 'hot', 3),
(1002, 'hat', 3),
(1003, 'hit', 3),
(1004, 'hbt', 3),
(1005, 'hct', 3),
(1006, 'adem', 4),
(1007, 'selim', 5),
(1008, 'yusuf', 5),
(1009, 'hip', 3),
(1010, 'HOT', 3),
(1011, 'hOt', 3),
(1012, 'h9t', 3),
(1013, 'hoot', 4),
(1014, 'haaat', 5),
(1015, 'hooooot', 7),
(1016, 'h-t', 3),
(1017, 'h?t', 3),
(1018, 'hOOOt', 5),
(1019, 'O', 1),
(1020, 'hoo', 3);

SELECT * FROM kelimeler; 

-- Q1 : Icerisinde 'ot' veya 'at' bulunan kelimeleri 
-- case-sensitive'e dikkat ederek listele
    -- NOT: VEYA islemi icin | karakteri kullanilir.
    
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'ot|at','c');

-- Q2 : Icerisinde 'ot' veya 'at' bulunan kelimeleri 
-- case-sensitive'e dikkat etmeksizin listele

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'ot|at','i');

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'ot|at');

-- Q3 : 'ho' veya 'hi' ile baslayan kelimeleri 
-- case-sensitive'e dikkat etmeksizin listele
    -- NOT: Baslangici gostermek icin ^ karakteri kullanilir.
    
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'^ho|^hi');

-- Q4 : Sonu 't' veya 'm' ile bitenleri 
-- case-sensitive'e dikkat ederek listele
    -- NOT: Bitisi gostermek icin $ karakteri kullanilir.
    
SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'t$|m$','c');

-- Q5 : h ile baslayip t ile biten 3 harfli kelimeleri 
-- (h ile t kucuk harfli olanlari) listeleyiniz
    -- NOT : [!-~] = Butun karakterleri ifade eder.
    --       [a-zA-Z0-9] = Harf ve rakamlari temsil eder.

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'h[!-~]t','c');

-- Q6 : h ile baslayip t ile biten, 2. karakteri sayi olan
-- 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'h[0-9]t','c');

-- Q7 : h ile baslayip t ile biten, 2. karakteri buyuk harf olan
-- 3 harfli kelimeleri (h ile t kucuk harfli olanlari) listeleyiniz

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'h[A-Z]t','c');

-- Q9 : 2. ve 3. harfi o olan tum kelimeleri 
-- (case sensitive olmaksizin) listeleyiniz 

SELECT kelime
FROM kelimeler
WHERE REGEXP_LIKE(kelime,'[A-Z]oo');