CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);

INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;

-- 1) Tabloya company_industry isminde sütun ekleyiniz
alter table workers add company_industry varchar(20);  ----içine değer atanmadığı için null yazar
----Tabloda bir değişiklik yapmak için Alter table kullanılır

-- 2) TABLOYA worker_address sütunu ve defaullt olarakta 
--'Miami, FL, USA' adresini ekleyiniz.
alter table workers add column worker_adress varchar(50) default 'Miami, FL, USA';

alter table workers add worker_address varchar(100) default 'Miami, FL, USA';
------Burada dikkat etmemiz gereken önce varchar olarak uzunluğu belirtildi
--- daha sonra default olarak bizden istenenleri girdik

-- 3) tablodaki worker_address sütununu siliniz
ALTER TABLE workers DROP COLUMN worker_address;
-----Burada Drop kullanarak istenilen sütunu siliyoruz
select * from workers;

-- 4) Tablodaki company_industry sütununu, 
--company_profession olarak değiştiriniz.
alter table workers rename column company_industry to company_profession;
alter table workers rename company_industry to company_profession;
-----Adını değiştirmek için rename diyoruz 
---column stun demektir

-- 5) Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees;
select * from employees;  
--------Burada tablonun genel ismini değiştirdiğimiz 
-- için select * from employees; diyerek çağırmamız gerekir

-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
ALTER TABLE employees
ALTER COLUMN title TYPE VARCHAR(50);
-----burada iki farklı yeri değiştirecegimiz için önce alter employees kısmını yapmamız gerekir
-- daha sonra ise column kısmını değiştirmek için alter column title diyerek yapmak gerekir
ALTER TABLE employees
ALTER title TYPE VARCHAR(50); --- Olmadan da çalışır

select * from employees;  

-- 6) Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
ALTER TABLE employees
ADD UNIQUE (title); ----unique dediğimiz zaman değiştirmek istenilen kısım parantez içinde alınmalıdır.

ALTER TABLE employees add constraint titlem unique (title); 
------ burada çözüm kısmında unique olan kısma dikkat etmek gerekir









