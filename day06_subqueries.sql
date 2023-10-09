/*================================= SUBQUERY =================================
    Sorgu icinde calisan sorguya SUBQUERY (ALT SORGU) denir.
============================================================================*/

CREATE TABLE calisanlar
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Honda');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'Toyota');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Honda');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Ford');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Hyundai');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Ford');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Honda');
INSERT INTO calisanlar VALUES(456783456, 'Selgun Bey', 'Ankara', 5500, 'Ford');

CREATE TABLE sirketler
(
sirket_id int,
sirket varchar(20),
calisan_sayisi int
);

INSERT INTO sirketler VALUES(100, 'Honda', 12000);
INSERT INTO sirketler VALUES(101, 'Ford', 18000);
INSERT INTO sirketler VALUES(102, 'Hyundai', 10000);
INSERT INTO sirketler VALUES(103, 'Toyota', 21000);

SELECT * FROM calisanlar;
SELECT * FROM sirketler;

-- ======================== WHERE ile SUBQUERY ===========================

/*----------------------------------------------------------------
 1) Calisan sayisi 15.000'den cok olan sirketlerin isimlerini
 ve bu sirkette calisan personelin isimlerini listeleyin
----------------------------------------------------------------*/

-- 1. adim Calisan sayisi 15.000'den cok olan sirketlerin isimlerini listeleyin
SELECT sirket
FROM sirketler
WHERE calisan_sayisi > 15000; -- ford ve toyota dondurur

-- 2. adim ford ve toyota'da calisan calisan personeli listeleyin
SELECT isim,sirket
FROM calisanlar
WHERE sirket IN ('ford','toyota');

-- 3. adim iki sorguyu birestirelim
SELECT isim,sirket
FROM calisanlar
WHERE sirket IN (SELECT sirket
				 FROM sirketler
				 WHERE calisan_sayisi > 15000);
 
 -- Honda sirketinin calisan sayisini 16000 olarak guncelleyiniz
 
 UPDATE sirketler
 SET calisan_sayisi = 16000
 WHERE sirket = 'honda';
 
  -- ford sirketinin calisan sayisini 13000 olarak guncelleyiniz
  
 UPDATE sirketler
 SET calisan_sayisi = 13000
 WHERE sirket = 'ford';
 
 /*----------------------------------------------------------------
 2) Sirket_id'si 101'den buyuk olan sirketlerin 
 maaslarini ve sehirlerini listeleyiniz
----------------------------------------------------------------*/

SELECT maas, sehir, sirket
FROM calisanlar
WHERE sirket IN(SELECT sirket
				FROM sirketler
                WHERE sirket_id>101);
                
-- sirketler tablosuna 104 id ile yeni bir sirket ekleyin

insert into sirketler values(104, 'Volkswagen', 22000);

-- calisanlar tablosuna volkswagen isrketinde calisan bir personel ekleyin

insert into calisanlar values(123456789, 'Beyza Nergiz', 'Istanbul',9000,'Volkswagen');

/*----------------------------------------------------------------                
  3) Ankara'da calisani olan sirketlerin sirket id ve calisan 
  sayilarini listeleyiniz.
----------------------------------------------------------------*/

SELECT calisan_sayisi, sirket_id
FROM sirketler
WHERE sirket IN (SELECT sirket
				FROM calisanlar
                WHERE sehir = 'Ankara');


/*----------------------------------------------------------------                
  4) Veli Yilmaz isimli personelin calistigi sirketlerin sirket 
  ismini ve calisan sayilarini listeleyiniz.
----------------------------------------------------------------*/

SELECT sirket, calisan_sayisi
FROM sirketler
WHERE sirket IN(SELECT sirket
				FROM calisanlar
                WHERE isim = 'Veli Yilmaz');



/*----------------------------------------------------------------                
  5) isminde e harfi icermeyen personellerin calistigi sirketlerin sirket 
  ismini ve sirket id'isni sayilarini listeleyiniz.
----------------------------------------------------------------*/

SELECT sirket, sirket_id
FROM sirketler
WHERE sirket IN(SELECT sirket
				FROM calisanlar
                WHERE isim not LIKE ('%e%'));



   /* ======================== SELECT ile SUBQUERY ===========================
  SELECT ile SUBQUERY kullanimi :
  
-- SELECT -- hangi sutunlari(field) getirsin
-- FROM -- hangi tablodan(table) getirsin
-- WHERE -- hangi satirlari(record) getirsin
  
 * Yazdigimiz QUERY'lerde SELECT satirinda field isimleri kullaniyoruz.
  Dolayisiyla eger SELECT satirinda bir SUBQUERY yazacaksak sonucun
  tek bir field donmesi gerekir.
  
  * SELECT satirinda SUBQUERY yazacaksak SUM, COUNT, MIN, MAX ve AVG gibi 
  fonksiyonlar kullanilir. Bu fonksiyonlara AGGREGATE FUNCTION denir.
=> Interview Question : Subquery'i Select satirinda kullanirsaniz ne ile 
kullanmaniz gerekir?
=========================================================================*/

/*----------------------------------------------------------------
 SORU 1- Her sirketin ismini, calisan sayisini ve personelin 
 ortalama maasini listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

SELECT sirket, calisan_sayisi, (SELECT AVG(maas)
								FROM calisanlar
                                WHERE calisanlar.sirket = sirketler.sirket)
FROM sirketler;

/*----------------------------------------------------------------
SORU 2- Her sirketin ismini ve personelin aldigi max. maasi 
listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

SELECT sirket, (SELECT MAX(maas)
				FROM calisanlar
				WHERE calisanlar.sirket = sirketler.sirket)
FROM sirketler;

/*----------------------------------------------------------------
SORU 3- Her sirketin id'sini, ismini ve toplam kac sehirde calisani
bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

SELECT sirket_id, sirket, (SELECT COUNT(sehir)
						 FROM calisanlar
						 WHERE calisanlar.sirket = sirketler.sirket)count_sehir
FROM sirketler;

/*----------------------------------------------------------------
SORU 4- ID'si 101'den buyuk olan sirketlerin id'sini, ismini ve 
toplam kac sehirde calisani bulundugunu listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

SELECT sirket_id, sirket, (SELECT COUNT(sehir)
						 FROM calisanlar
						 WHERE calisanlar.sirket = sirketler.sirket)count_sehir
FROM sirketler
WHERE sirket_id > 101;

/*----------------------------------------------------------------
SORU 5- a harfi iceren sirketlerin id'sini, ismini ve 
calisanlarinin min maasini listeleyen bir QUERY yaziniz.
----------------------------------------------------------------*/

SELECT sirket_id, sirket, (SELECT MIN(maas)
						 FROM calisanlar
						 WHERE calisanlar.sirket = sirketler.sirket)min_maas
FROM sirketler
WHERE sirket LIKE '%a%';

/*----------------------------------------------------------------
SORU 6- Her sirketin ismini,calisan sayisini ve personelin 
aldigi max. ve min. maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

SELECT sirket, calisan_sayisi, (SELECT MIN(maas)
								FROM calisanlar
								WHERE calisanlar.sirket = sirketler.sirket)min_maas,
                               (SELECT MAX(maas)
								FROM calisanlar
								WHERE calisanlar.sirket = sirketler.sirket)max_maas
FROM sirketler;

/*----------------------------------------------------------------
SORU 7- Ismi 'H' ile baslayan sirketlerin ismini ve calisan sayisini 
ve iscilere odedigi toplam maasi listeleyen bir QUERY yazin.
----------------------------------------------------------------*/

SELECT sirket, calisan_sayisi,(SELECT SUM(maas)
							   FROM calisanlar
							   WHERE calisanlar.sirket = sirketler.sirket)sum_maas
FROM sirketler
WHERE sirket LIKE 'h%';