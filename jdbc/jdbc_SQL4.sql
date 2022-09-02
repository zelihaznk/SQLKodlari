--Function oluşturma

--1. Örnek: İki parametre ile çalışıp bu parametreleri toplayarak 
--return yapan bir fonksiyon oluşturun.

--addf toplama fonksiyonu demektir. Ama aşağıda değiştirdik
-- $$ $$ Java'da yer alan {} süslü parantez gibidir SQL'de

--Intelijde {} suslu parantez kullanirdik SQL(pgadmin4) ise $$ isareti kullanilir acma kapatma islemi icin 
-- Örnek: İki parametre ile çalışıp bu parametreleri 
--toplayarak return yapan bir fonksiyon oluşturun.

CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
 BEGIN  ---Başlangıç kısmı
 
 RETURN x+y;
 
 END   ----Bitiş kısmı
$$

SELECT * FROM toplamaF(15,25) AS toplam;










