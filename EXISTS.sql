
-- EXISTS, NOT EXISTS --
-- EXISTS condition subquery'ler ile kullanılır. IN ifadesinin kullanımına benzer
-- EXISTS ve NOT EXISTS ifadeleri de alt sorgudan getirilen değerlerin içerisinde 
-- bir değerin olması veya olmaması durunda işlem yapılmasını sağlar
-- Exists true, false gibidir. Boolean

/*
SQL EXISTS komutu, belirtilen bir alt sorguda herhangi bir veri 
varlığını test etmek için kullanılır.

SELECT sütun(s)
FROM tablo_adı
WHERE EXISTS
(SELECT sütun FROM tablo_adı WHERE koşul);

*/

/*
IN ifadesinin kullanımına benzer olarak, EXISTS ve NOT EXISTS 
ifadeleride alt sorgudan getirilen değerlerin içerisinde bir 
değerin olması veya olmaması durumunda işlem yapılmasını sağlar. 
EXISTS ifadesi kullanıldığında, alt sorguda istenilen şartların 
yerine getirildiği durumlarda ilgili kaydın listelenmesini sağlar. 
NOT EXITS ise EXISTS‘in tam tersi olarak alt sorguda istenilen 
şartların sağlanmadığı durumlarda  ilgili kaydın listelenmesini 
sağlar.

Exists Kullanımı
SELECT Ad FROM Ogrenci AS o WHERE EXISTS
(SELECT * FROM Bolum AS b WHERE o.BolumID=b.BolumID)

Not Exists Kullanımı
SELECT Ad FROM Ogrenci AS o WHERE NOT EXISTS
(SELECT * FROM Bolum AS b WHERE o.BolumID=b.BolumID)
*/


CREATE TABLE mart(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');


CREATE TABLE nisan(
	urun_id int ,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.

/*
SELECT sütun(s)
FROM tablo_adı
WHERE EXISTS
(SELECT sütun FROM tablo_adı WHERE koşul);
*/


select urun_id, musteri_isim from mart
WHERE exists (select urun_id from nisan where mart.urun_id = nisan.urun_id); 

--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim, musteri_isim from nisan
where exists (select urun_isim from mart where mart.urun_isim = nisan.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.

select urun_isim, musteri_isim from nisan
where not exists (select urun_isim from mart where mart.urun_isim =nisan.urun_isim);

























