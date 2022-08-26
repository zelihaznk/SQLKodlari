-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama))
-Subquery içinde de kullanılır
-ANcak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
*/

select * from calisanlar2;

--calisanlar2 tablosundaki en yüksek maaş değerini listeleyiniz
select max(maas) from calisanlar2;

--calisanlar2 tablosundaki maaşların toplamını listeleyiniz
select sum(maas) from calisanlar2;

--calisanlar tablosundaki maas ortalamalrını listeleyiniz
select avg(maas) from calisanlar2;
select round(avg(maas)) from calisanlar2;--noktadan sonrası gitti virgülden
select round(avg(maas),2) from calisanlar2;

--calisanlar tablosundan en düşük maaşı listeleyiniz
select min(maas) from calisanlar2;

--calisanlar2 tablosundaki kac kişinin maaş aldıgını listeleyin
select count(maas) from calisanlar2;

select * from markalar;

-- Her markanin ismini, calisan sayisini ve o markaya ait 
--calisanlarin toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi,(select sum(maas) from calisanlar2 
where marka_isim = isyeri) as toplam_maas from markalar;


-- ALIAS (AS) --> Tabloda geçici isim vermek istersek koşuldan sonra AS sutun_isim olarak kullanılır.



-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
select marka_isim, calisan_sayisi, (select max(maas) from calisanlar2 where marka_isim=isyeri) 
as max_maas, (select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas from markalar;

select marka_isim, calisan_sayisi, (select max(maas) from calisanlar2 where marka_isim = isyeri) as max_maas, 
                                   (select min(maas) from calisanlar2 where marka_isim = isyeri) as min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
--listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, (select count(sehir) from calisanlar2 
where marka_isim = isyeri) as sehir_sayisi from markalar;

--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) as enyuksek_ikinci_maas from calisanlar2 --bu kısımda en yüksek maasi belirledik
where maas < (select max(maas) from calisanlar2); --daha sonra ise burada kosulları vererek ikinciyi bulduk
--(yalnız maas sütunu küçük olmalı birinci maaştan diyor hemen üstte)

----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) as endusuk_ikinci_maas from calisanlar2 
where maas > (select min(maas) from calisanlar2);

----En yüksek üçüncü maas değerini bulun
SELECT MAX(maas) as enyuksek_ucuncu_maas from calisanlar2
WHERE maas<(select max(maas)from calisanlar2 WHERE maas< (SELECT max(maas) from calisanlar2));

--En düşük üçüncü maas değerini bulununuz (ÖDEV)
select min(maas) AS endusuk_ucuncumaas from calisanlar2
where maas>(select min(maas) from calisanlar2
where maas>(select min(maas) from calisanlar2));









