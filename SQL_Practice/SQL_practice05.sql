
/*============================== JOIN İSLEMLERİ ===============================
    foreıgn key id si ortakları yanyana yazıyordu bu bikaç tablodan istenilen
    sütunları alır birleştirir. set istenilen sütunları tek sütunda birleştirir
    Set Operatorleri (Union,Intersect,Minus) farklı tablolardaki sutunlari
    birlestirmek için de kullanilir.
    Join islemleri ise farklı Tablolari birlestirmek icin kullanilir. Diger
    bir ifade ile farkli tablolardaki secilen sutunlar ile yeni bir tablo
    olusturmak icin kullanilabilir.
    JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
    Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek
    icin JOIN islemleri kullanilabilir.
    ORACLE SQL'de 4 Cesit Join islemi kullanilabilmektedir.
    1) FULL JOIN:  Tablodaki tum sonuclari gosterir
    2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
    3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
    4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir*/



CREATE TABLE sirketler
(
	sirket_id int,
	sirket_isim VARCHAR(20)
);

INSERT INTO sirketler VALUES(100, 'Toyota');
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford');
INSERT INTO sirketler VALUES(103, 'Hyundai');

CREATE TABLE siparisler
(
	siparis_id int,
	sirket_id int,
	siparis_tarihi DATE
);

INSERT INTO siparisler VALUES(11, 101, '2022-04-17');
INSERT INTO siparisler VALUES(22, 102, '2022-04-18');
INSERT INTO siparisler VALUES(33, 103, '2022-04-19');
INSERT INTO siparisler VALUES(44, 104, '2022-04-20');
INSERT INTO siparisler VALUES(55, 105, '2022-04-21');

select * from sirketler;
select * from siparisler;

-----iki tabloda ortak değerler olmazsa joın yapılmaz yukarıdaki iki 
--tabloda ortak yer var

--kesişimde olan ortak olanlar ınner (kesişim) joini oluşturur

/*
Left=sirketler   right=sparisler
*/
---on bağla demek

--SORU1: Iki Tabloda sirket_id’si ayni olanlarin; sirket_isim, 
--siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT sirket_isim, siparis_id,siparis_tarihi
FROM sirketler INNER JOIN siparisler
ON sirketler.sirket_id = siparisler.sirket_id;  
----Burası tarihi veriyor

select A.sirket_id, A.sirket_isim, B.siparis_id from siparisler as B
inner join sirketler as A
on A.sirket_id = B.sirket_id;
----Buradaysa sadece ortak olan id ler geliyor

select A.sirket_id, A.sirket_isim, B.siparis_id, B.siparis_tarihi from siparisler as B
inner join sirketler as A
on A.sirket_id = B.sirket_id;
-----İkisinin birleşimle tam sonuç burada çözülüyor

--SORU2: sirketler tablosundaki tum sirketleri ve bu sirketlere ait 
--olan siparis_id ve siparis_tarihleri listeleyen bir sorgu yaziniz.
SELECT A.sirket_isim,B.siparis_tarihi,B.siparis_id
FROM siparisler AS B
LEFT JOIN sirketler AS A
ON A.sirket_id = B.sirket_id;

/*
Tablodan alacağınız veriyi inceliyoruz. önce hangisi gelmesii lazımsa 
onu almanın iki yolu var. fromdan sonra önce o tablo ismini yazıp 
left kullanacaz. veya joinden sonra o tablo ismini yazdıysak right 
yazarak o tablonun önce secilmesini sağlarız
*/

----Burada yazan çözüme göre bakmalısın 
select sirket_isim, siparis_id, siparis_tarihi from sirketler as A
left join siparisler as B
on A.sirket_id = B.sirket_id; -- on --> arti degerler
-- right'a gore 
select sirket_isim, siparis_id, siparis_tarihi from siparisler as B
right join sirketler as A
on A.sirket_id = B.sirket_id;

----Hocanın çözümü
select A.sirket_id , A.sirket_isim, B.siparis_id, B.siparis_tarihi from siparisler as B
right join sirketler as A
on A.sirket_id= B.sirket_id;
--left 
select A.sirket_id , A.sirket_isim, B.siparis_id, B.siparis_tarihi from sirketler as A
left join siparisler as B
on A.sirket_id= B.sirket_id;

----Sorunun full join ile çözümü
select a.sirket_isim ,b.siparis_id,b.siparis_tarihi
from sirketler as a
full join
siparisler as b
on a.sirket_id=b.sirket_id;

--SORU3: siparisler tablosundaki tum siparis_id ve siparis_tarihleri 
--ile bunlara karşılık gelen sirket_isimlerini listeleyen bir 
--sorgu yaziniz.
select b.siparis_id , b.siparis_tarihi, a.sirket_isim
from sirketler as a
full join
siparisler as b
on a.sirket_id=b.sirket_id;









