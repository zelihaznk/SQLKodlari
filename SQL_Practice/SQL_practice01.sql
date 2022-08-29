-- sql_practise 1   
/*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~
ILIKE : ~~*
NOT LIKE : !~~
NOT ILIKE :!~~*
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
*/

create table personel                                                                         
(                                                                                             
id serial primary key, --serial   otomatik id atiyor -- serial id'yi otomatik olarak artırır.                                                                    
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                     
email varchar(30)                                                                             
);                                                                                            
																							  
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 

insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

select * from personel;

-- 1) Tablo bilgilerini listeleyiniz.
select * from personel; -- tüm bilgileri yazar

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
select isim, yas, maas from personel;
-------İstenen şeyi almak için select komutundan sonra istenen veriler 
--girilerek from denilir.

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel where id=8;
--------Bizden bir şeylerin bilgilerini istediği için bilgilerin tamamı 
--için select ve from arasına * konulur ve sonra istenen değer yazılır.

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini 
--listeleyiniz
select isim, id, yas, email from personel where id=5;
------ Listelememizi istediği her seyi select sonrası yazıp from deyip
-- personel adını yazıyoruz ve where ile koşulu giriyoruz

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel where yas>30;
------ Hepsinden birlikte dediği için yıldızlı select yapıp koşulla verdik

-- 6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select * from personel where maas !=21000;
-- Olmayani bulmak için ya isnot kullanılır yada != kullanılır

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel where isim ~~* 'a%';
select * from personel where isim ilike 'a%';
------like basına i koyup ilike olunca büyük küçük fark etmez demektir
------% işareti ne ile devam ederse etsin demek oluyor
------ Çözümü yapabilmek için adım adım bizden istenilenler girilir

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz.
select * from personel where isim ~~* '%n';
select * from personel where isim ilike '%n';
------Çözümde dikkat edilmesi gereken bizden istediğini ya baş veya sona göre ayarlanır.

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personel where email like '%@gmail.com';
------Burada soruyu çözerken like ifedesi kullanılmadığı zaman cevabı doğru vermiyor.


-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel where email not ilike '%@gmail.com%';
------- Soruyu çözerken olmayan dediği için not ilike verdik
---Null gelmedi çünkü yüzde (%) ile arama yaptığımız için gelmez.

select * from personel where email !~~* '%gmail.com%' or email is null;
------ Bu şekilde yapınca Null gelir

-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel where id in(3,5,7,9);
----- Burada içerisinde birçok değer aynı değişkene ait farklı değerleri
--döndürdüğü için IN kullandık ve istediğimiz değeri yazdık içine

select * from personel where id= 3 or id=5 or id=7 or id=9;
--- Soru bu şekilde de çözülebilirdi

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas in(39,48,54); ----Bu olanları verir
select * from personel where yas not in(39,48,54);
-----NOT IN diyerek olmayanlar bulunur

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;
---------Between arasında anlamına gelir

select * from personel where yas>30 and yas<40;
------Bu şekilde de çözümü vardır

-- 14) yaşı 30 ve 40 arasında olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not between 30 and 40;

select * from personel where 30>yas or yas>40;

SELECT * FROM personel WHERE YAS<30 OR YAS>40;
-------3 farklı çözümle yapıldı

-- 15) emaili null olan personel bilgilerini listeleyiniz.
select * from personel where email is NULL;

-- 16) personel bilgilerini yaşa göre sıralayınız.
select * from personel order by yas;
----Sırama yapacağımız için ORDER BY kullanmamız gerekiyordu şart olarak
---- Buranın doğal sıralaması küçükten büyüğe sıralanmıştır

-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel order by maas;
------Bu şekilde küçükten büyüğe maaş olarak sıraladık

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;
--- Burada sıralama yaparken büyükten küçüge dediği için desc kullanılır

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;
-- Maasları buyukten kücüge dediği için yine desc kullandık

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit 3;
------Burada limit ile en yüksek ilk değerleri verir LIMIT sınırlandırma yapar









