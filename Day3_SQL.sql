CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, -- UNIQUE --> Bir sutundaki tüm değerlerin BENZERSİZ yani tek olmasını sağlar
maas int NOT NULL, -- NOT NULL --> Bir sutunun NULL içermemesini yani boş olmamasını sağlar
ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); --Unique

INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); --NOT NULL

INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --UNIQUE
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); --NOT NULL

INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); --PRIMARY KEY
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY

INSERT INTO calisanlar VALUES('10012', 'nil', 2000, '2018-04-14');

-- FOREIGN KEY--
CREATE TABLE adresler
(
adres_id char(5) ,
sokak varchar(20),
cadde varchar(30),
sehir varchar(20),
CONSTRAINT fk FOREIGN KEY (adres_id) REFERENCES calisanlar(id)
);

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

select * from adresler;
select * from calisanlar;

INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-------Yukarıda calısanlar tablosuna eklediğimiz için artık çalışıyor
--Parent tabloda olmayan id ile child tabloya ekleme yapamayız

INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');

--Calısanlar id ile adresler tablosundaki adres_id ile eşlesenlere bakmak için
select * from calisanlar,adresler WHERE calisanlar.id = adresler.adres_id;

DROP table calisanlar;
--Parant tabloyu yani primary key olan tabloyu silmek istediğimizde tabloyu silmez
--Önce child tabloyu silmemiz gerekir

delete from calisanlar where id='10002';--Parent
delete from adresler WHERE adres_id = '10002';--Child

drop table calisanlar;

-- ON DELETE CASCADE --
-- Her defasında önce child tablodaki verileri silmek yerine 
-- ON DELETE CASCADE silme özelliğini aktif hale getirebiliriz
-- Bunun icin FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmamız yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO talebeler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 'Mustafa Bak', 'Can',99);

CREATE TABLE notlar(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebeler(id)
ON DELETE CASCADE
);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90);

select * from talebeler;
select * from notlar;
select * from talebeler, notlar;

delete from notlar WHERE talebe_id = '123';

delete from talebeler where id = '126'; -- ON DELETE CASCADE kullandıgımız için Parent table'den direkt silebildik
-- Parent tableden silebildiğimiz için child tabledan da silinmiş olur

DELETE from talebeler;  

DROP table talebeler CASCADE; -- Parent tableyi kaldırmak istersek Drop table tablo adından sonra 
--CASCADE komutunu kullanırız

/*
CASCADE: REFERENCES ile belirtilen sütunda bir eylem (UPDATE, DELETE) olduğunda 
Foreign key ile belirtilen ilişkili sütunda benzer eylemi yapar.

NO ACTION: Foreign key sütunu ve REFERENCES ile belirtilen sütunda bir ilişki varsa, 
REFERENCES ile belirtilen sütunda bir eyleme (UPDATE, DELETE) izin vermez.

SET NULL: REFERENCES ile belirtilen sütunda bir eylem (UPDATE, DELETE) olduğunda 
Foreign key ile belirtilen ilişkili sütunu NULL yapar.

NOT: Foreign key sütununda NOT NULL kısıtlaması varsa hata verir.

SET DEFAULT: REFERENCES ile belirtilen sütunda bir eylem (UPDATE, DELETE) olduğunda 
Foreign key ile belirtilen ilişkili sütuna DEFAULT değerini verir.

NOT: Foreign key sütununda DEFAULT kısıtlaması yoksa hata verir.

RESTIRCT: MySQL VTYS içerisinde bulunan bu eylem NO ACTION ile aynı işleve sahiptir.
*/




-- Talebeler tablosundaki isim sütununa NOTT NULL kısıtlaması ekleyiniz ve veri tipini VARCHAR(30) olarak değiştiriniz
--Yeni bir şey eklemek istediğimiz zaman alter table yaparız

alter table talebeler 
alter column isim TYPE VARCHAR (30),--TYPE İLE DATA TÜRÜ DEĞİŞTİ
alter column isim SET NOT NULL; -- SET İLE DE EKLEME YAPILDI
--Alter table column üzerinde değişiklik yapar

select * from talebeler;

-- talebeler tablosundaki yazılı_notu sütununa 60 dan buyuk rakam girilebilsin

alter table talebeler
ADD CONSTRAINT sinir CHECK (yazili_notu>60);
--CHECK kısıtlaması ile tablodaki istediğimiz sütunu sınırlandırabiliriz
-- yukarda 60'i sinir olarak belirledigimiz icin bunu eklemedi


INSERT INTO talebeler VALUES(128, 'Mustafa Can', 'Hasan',45);
------Not 60 dan küçük olduğu için hata verir!!

create table ogrenciler(
id int,
isim varchar(45),
adres varchar(100),
sinav_notu int
);

Create table ogrenci_adres
AS 
SELECT id, adres from ogrenciler;
-----Yeni bir tablo oluştur ve ıd ve adresi öğrencilerden alarak oluştur

select * from ogrenciler;
select * from ogrenci_adres;

--Tablodaki bir sütunu bir sütuna PRIMARY KEY ekleme
alter table ogrenciler
ADD PRIMARY KEY (id);
------>clustered index Clustered index bir tabloda yanlızca bir tane olur. Aslında bunu hepimiz kullanıyoruz genelde. Clustered index ile tablodaki kayıtlar, fiziksel olarak indeksleme alanına göre dizilmiş şekildedir. Bu yapılanma dengeli ağaç(B-Tree) yapısına sahibtir.
-----PRIMARY KEY benzersiz olmasını sağlar ve null ekleme yapılmaz

--PRIMARY KEY olusturmada 2. yol
alter table ogrenciler
ADD CONSTRAINT pk_id PRIMARY KEY(id);



--PK'dan sonra FK ataması
alter table ogrenci_adres
ADD foreign key (id) REFERENCES ogrenciler;----Foreinkey olan kısım nonclustered olur
--Child tabloyu parent tablodan olusturdugumuz için sütun adı verilmedi

--PK'yi silme CONTRAINT silme
alter table ogrenciler DROP CONSTRAINT pk_id;

--FK'yi silme CONTRAINT silme
alter table ogrenci_adres DROP CONSTRAINT ogrenci_adres_id_fkey;

--Yazılı notu 85'den buyuk olan talebe bilgilerini getirin
Select * from talebeler WHERE yazili_notu>85;

--İsmi Mustafa Bak olan talebenin tüm bilgilerini getirin
select * from talebeler WHERE isim= 'Mustafa Bak';

Select * from talebeler WHERE yazili_notu>85 and isim= 'Mustafa Bak';
----and tüm şartların doğru olması gerekir

Select * from talebeler WHERE yazili_notu>85 or isim= 'Mustafa Bak';
----or Herbir satır için herhangi bir satırın şartını sağlıyorsa 

-- SELECT komutunda -- BETWEEN koşulu
-- Between belirttiğiniz 2 veri arasındaki bilgileri listeler
-- Between de belirttiğimiz değerler de listelemeye dahildir

create table personel
(
id char(4),
isim varchar(50),
maas int
);

insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);

insert into personel values('1007', 'Erhan Ece', 100000);
insert into personel values('1008', 'Binali Can', 100000);

/*
    AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir
Bir tanesi gerçekleşmezse listelemez
    Select * from matematik sinav1 > 50 AND sınav2 > 50
Hem sınav1 hemde sınav2 alanı, 50'den büyük olan kayıtları listeler
    OR (VEYA): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
    select * From matematik sınav>50 OR sınav2>50 
Hem sınav1 veya sınav2 alanı, 50 den büyük olan kayıtları listeler    
*/

select * from personel;

--id'si 1003 ile 1005 arasında olan personel bilgisini listeleyiniz
select * from personel WHERE id BETWEEN '1003' and '1005'; --personel tablosundan her şeyi getir ama id 1003 ve 1005 dahil olarak getir

--2.YOL:
select * from personel WHERE id>='1003' and id<='1005';

--Derya Soylu ile Yavuz Bal arasındaki personel bilgisini listeleyiniz
select * from personel WHERE isim BETWEEN 'Derya Soylu' and 'Yavuz Bal';

--Maaşı 70000 veya ismi Sena olan personeli listele
select * from personel WHERE maas='70000' or isim='Sena Beyaz';
--OR ile dahil ettik buna dikkat etmelisin

--IN : Birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları tek komutta yazabilme imkanı verir
-- Farklı sütunlar için IN kullanılamaz

select * from personel;

--id'si 1001,1002 ve 1004 olan personelin bilgilerini listele
select * from personel WHERE id ='1001' or id='1002' or id ='1004';

--2. YOL:
select * from personel WHERE id IN ('1001','1002','1004');

--Maaşı sadece 70000 , 100000 olan personeli listele
select * from personel WHERE maas IN (70000, 100000);

/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
*/

--İsmi A harfi ile başlayan personeli listeleyin 
select * from personel WHERE isim LIKE 'A%'; --Başı derse % sonra


--İsmi t harfi ile biten personeli listele
select * from personel WHERE isim LIKE '%t'; -- Sonu derse % önce

--Isminin 2. harfi e olan personeli listeleyiniz
select * from personel WHERE isim LIKE '_e%';

---Isminin 5. harfi e olan personeli listeleyiniz
select * from personel where isim like '____a%';





