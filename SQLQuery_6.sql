--1--
SELECT [productid],
       [name],
       [city],
       ROW_NUMBER() OVER (order by [city]) as [порядковий номер]    
FROM [products] ;
--2--
SELECT [productid],
       [name],
       [city],
       ROW_NUMBER() OVER (PARTITION BY [city] ORDER BY [name]) as [порядковий номер в межах міста]    
FROM [products];
--3--
select * from (
SELECT [productid],
       [name],
       [city],
       ROW_NUMBER() OVER (PARTITION BY [city] ORDER BY [name]) as [порядковий номер в межах міста]    
FROM [products]) as cc where [порядковий номер в межах міста]=1;
--4--
select productid, detailid, quantity, sum(quantity) over (partition by productid) as all_quantity_per_prod,
sum(quantity) over (partition by detailid) as all_quantity_per_det from supplies;
--5--
select * from (SELECT [supplierid],[detailid],[productid], quantity,
ROW_NUMBER() OVER (order by [supplierid] ) as rn,
count(*) over () as tot
FROM [supplies]) as cc where rn between 10 and 15 ;
--6--
select * from (SELECT [supplierid],[detailid],[productid], quantity,
avg(quantity) OVER () as avg_qua
FROM [supplies]) as cc where avg_qua > quantity;