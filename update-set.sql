-- DML --> UPDATE --> Tablodaki verileri günceller
/*
Bir tablodaki kaydın bir ya da daha fazla alanını günceller, değiştirir.
Olan bir kaydı güncellemeye ve değiştirmeye yarar

UPDATE TABLOADI
SET COLUMN1=VALUE1, COLUMN2=VALUR2
WHERE<ŞARTLAR>

*/

CREATE TABLE tedarikciler -- parent
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);

INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammen');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');



CREATE TABLE urunler -- child
(
ted_vergino int,
urun_id int,
urun_isim VARCHAR(50),
musteri_isim VARCHAR(50),
CONSTRAINT fk_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
on delete cascade
);

INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayşe Can');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yılmaz');


select * from tedarikciler;
select * from urunler;

--  vergi_no’su 102 olan tedarikcinin firma ismini 'Vestel' 
--olarak güncelleyeniz.

UPDATE tedarikciler --tedarikciler tablosunu değiştir 
SET firma_ismi = 'Vestel' WHERE vergi_no = 102;
--ve firma ismini vestel olarak güncelle ve vergi numarası 102 olanı yap

-- vergi_no’su 101 olan tedarikçinin firma ismini 'casper' 
--ve irtibat_ismi’ni 'Ali Veli' olarak güncelleyiniz.

UPDATE tedarikciler
SET firma_ismi = 'Casper',irtibat_ismi='Ali Veli' where vergi_no=101;
--UPDATE ile değiştirme yapılır
--SET ile güncelleme yapılır

select * from urunler;
select * from tedarikciler;

--  urunler tablosundaki 'Phone' değerlerini 'Telefon' 
--olarak güncelleyiniz.
UPDATE urunler  --değiştir
SET urun_isim ='TELEFON' -- TELEFON olarak günceller
WHERE urun_isim ='Phone'; --ismi Phone olanı

--  urunler tablosundaki urun_id değeri 1004'ten büyük 
--olanların urun_id’sini 1 arttırın.
UPDATE urunler
SET urun_id =urun_id+1 where urun_id>1004; --Ali, Aslan ve Cananın urun_id 1 arttı

--  urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino 
--sutun değerleri ile toplayarak güncelleyiniz.
UPDATE urunler
SET urun_id=ted_vergino+urun_id;

--urunler tablosundan Ali Bak’in aldigi urunun ismini, 
--tedarikci tablosunda irtibat_ismi
-- 'Adam Eve' olan firmanın ismi (firma_ismi) ile degistiriniz.
--("burada urunler ve tedarikciler tablolarini yeniden olusturduk soruyu çözebilmek için)

select * from urunler, tedarikciler;

UPDATE urunler
SET urun_isim = (select firma_ismi from tedarikciler where irtibat_ismi='Adam Eve')
WHERE musteri_isim = 'Ali Bak';

select * from urunler;
select * from tedarikciler;


-- Urunler tablosunda laptop satin alan musterilerin ismini, 
--firma_ismi Apple’in irtibat_isim'i ile degistirin.
UPDATE urunler
SET musteri_isim = (select irtibat_ismi from tedarikciler where firma_ismi ='Apple')
WHERE urun_isim = 'Laptop';








