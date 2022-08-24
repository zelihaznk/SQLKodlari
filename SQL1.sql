/*
DDL - DATA DEFINITION LANG.
CREATE - ALTER - DROP
*/

--CREATE - TABLO OLUSTURMA -
CREATE table ogrenci(
ogr_no INT,
ogr_isimsoyisim VARCHAR (30),
notlar REAL,
yas INT,
adres VARCHAR(50),
kayit_tarih DATE		
);
-- VAROLAN TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE table ogr_notlari
AS 
SELECT ogr_no, notlar FROM ogrenci;

SELECT * FROM ogrenci;
SELECT * FROM ogr_notlari;