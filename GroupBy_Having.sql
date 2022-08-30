-- GROUP BY -- HAVING --
/*
HAVING ifadesinin islevi where ifadesininkine cok benziyor. Ancak kumeleme fonksiyonlari ile
WHERE ifadsi birlikte kullanilmadiginda HAVING ifadesine ihtiyac duyulmustur
GROUP BY ile kullenilir. Gruplamadan sonraki sart icin GROUP BY dan sonra HAVING kullanilir
*/


CREATE TABLE workers
(
  id CHAR(9),
  name VARCHAR(50),
  state VARCHAR(50),
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM workers;

--Toplam salary değeri 2500 üzeri olan her bir çalışan için salary 
--toplamını bulun.
SELECT name, SUM(salary) AS "Total Salary" 
FROM workers 
GROUP BY name 
HAVING SUM(salary)>2500;
-----Group by'dan sonra where olmaz having olmalıdır

--Birden fazla çalışanı olan, her bir state için çalışan 
--toplamlarını bulun.
SELECT state, COUNT(state) AS number_of_employes ---state'leri say ama gruplama yaparak
FROM workers
GROUP BY state
HAVING COUNT(state) >1;--- Having group by ardından filtreleme için kullanılır

--Her bir state için değeri 3000'den az olan maximum salary 
--değerlerini bulun.
SELECT state,  MAX(salary) AS "max salary"
FROM workers
GROUP BY state
HAVING MAX(salary) <3000;

SELECT * FROM workers;

--Her bir company için değeri 2000'den fazla 
--olan minimum salary değerlerini bulun.
SELECT company, MIN(salary) AS min_salary
FROM workers 
GROUP BY company
HAVING MIN(salary) > 2000;
-----Burada yapılan işlem select ile nereden isteniyorsa onun SELECT company yazılmasıyla başlar
--Daha sonra MIN(salary) AS min_salary yazılır ve FROM yapılarak nereden istendiği belirtilir
--GROUP BY company ile gruplanılır havıng ile şart konulur


--Tekrarsız isimleri çağırın.
SELECT DISTINCT name
FROM workers;
---DISTINCT clouse, çağrılan terimlerden tekrarlı olanların sadece birincisini alır

--Name değerlerini company kelime uzunluklarına göre sıralayın.
SELECT name, company
FROM workers 
ORDER BY LENGTH(company);
------LENGTH ile biz burada uzunluğunu alıyoruz tıpkı JAVA'da olduğu gibi

--Tüm name ve state değerlerini aynı sütunda çağırarak her bir sütun 
--değerinin uzunluğuna göre sıralayın.
--concat() fonksiyonu birden fazla sutun veya string degerini birlestirmek icin kullanilir 

---1. YOL:
SELECT CONCAT(name, ' ', state) AS name_and_state
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);
----CONCAT(name, state) ile buradaki parantez içinde olanlar birleştirildi
-----ORDER BY LENGTH(name) + LENGTH(state); ile uzunlukları topla getir dedik

---2. YOL:
SELECT name || ' ' || state || ' ' || LENGTH(name) + LENGTH(state) AS "Name and States"
FROM workers
ORDER BY LENGTH(name) + LENGTH(state);
---  ||--> toplama işlemi yapar








