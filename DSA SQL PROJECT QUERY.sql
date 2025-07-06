create database KMS_DB
DROP TABLE KMS_STORES

select * from [dbo].[KMS_STORES]

-----PRODUCT CATEGORY WITH HIGHEST SALES-----
SELECT [Sales] FROM [dbo].[KMS_STORES]

select top 1 product_category, sum(sales) as highestsales
from [dbo].[KMS_STORES]
group by product_category
order by highestsales desc

------TOP 3 REGIONS AND BOTTOM 3 REGIONS IN TERMS OF SALES -----
-----TOP3-----
SELECT TOP 3 REGION, SUM(SALES) AS TOTAL_SALES
FROM [dbo].[KMS_STORES]
GROUP BY REGION
ORDER BY TOTAL_SALES DESC;

------BOTTOM 3 ------
SELECT TOP 3 REGION, SUM(SALES) AS leastsales
FROM [dbo].[KMS_STORES]
GROUP BY REGION
ORDER BY leastsales ASC;

---total sales of appliance in ontario-----
select sum(sales) as total_appliance_sales
from [dbo].[KMS_STORES]
where region = 'ontario' and product_sub_category = 'appliances'

----- advice management on what to do to increase revenue from the bottom 10 customers-----
select TOP 10 customer_name, sum(sales) as total_revenue
from [dbo].[KMS_STORES]
group by customer_name
order by total_revenue ASC

------WHICH SHPPING METHOD COST THE MOST----
SELECT TOP 1 SHIP_MODE, SUM(SHIPPING_COST) AS TOTAL_SHIPPING_COST
from [dbo].[KMS_STORES]
GROUP BY SHIP_MODE
ORDER BY TOTAL_SHIPPING_COST

-----import order status table-----
select * from [dbo].[Order_Status]
------ most valuable customers and what products or services do they typically purchase ----
most valuable customers are regular customers that bring in more sales 
-----so top customers by sales-----
select top 5 customer_name, sum(sales) as totalpurchase
from [dbo].[KMS_STORES]
group by customer_name
order by totalpurchase desc

the most valuable customers are Emily Phan,Deborah Brumfield, Roy Skaria,Sylvia Foulston, Grant Carroll

products or services they purchase
to do this you need to join 2 tables 

select [dbo].[KMS_STORES].*, Order_Status.status
from [dbo].[KMS_STORES]
join [dbo].[Order_Status]
on [dbo].[KMS_STORES].order_id = [dbo].[Order_Status].order_id

---- determine the products they purchased-----
select product_name, sum(sales) as customertotalpurchase
from [dbo].[KMS_STORES]
where customer_name = 'Emily Phan'
group by product_name
order by customertotalpurchase desc

select product_name, sum(sales) as customertotalpurchase
from [dbo].[KMS_STORES]
where customer_name = 'Deborah Brumfield'
group by product_name
order by customertotalpurchase desc

select product_name, sum(sales) as customertotalpurchase
from [dbo].[KMS_STORES]
where customer_name = 'Roy Skaria'
group by product_name
order by customertotalpurchase desc

select product_name, sum(sales) as customertotalpurchase
from [dbo].[KMS_STORES]
where customer_name = 'Sylvia Foulston'
group by product_name
order by customertotalpurchase desc

select product_name, sum(sales) as customertotalpurchase
from [dbo].[KMS_STORES]
where customer_name = 'Grant Carroll'
group by product_name
order by customertotalpurchase desc

-------which small business customer had the highest sale-----
select * from [dbo].[KMS_STORES]

select top 1 customer_name, sum(sales) as highestbusinesssales
from [dbo].[KMS_STORES]
where customer_segment = 'small business'
group by customer_name 
order by highestbusinesssales desc

--- which corporate customer placed the most number of orders 2009-2012-----
select top 1 customer_name, count(order_id) as totalorders
from [dbo].[KMS_STORES]
where customer_segment = 'corporate'
and  order_date between '2009-01-01' and '2012-12-31'
group by customer_name 
order by totalorders desc

-------which consumer customer was the most profitable one-----
select top 1 customer_name, sum(profit) as Mostprofitable
from [dbo].[KMS_STORES]
group by customer_name
order by Mostprofitable desc

--------which customer returned items and what segment do they belong to-----
select customer_name, customer_segment
from [dbo].[KMS_STORES]
join [dbo].[Order_Status]
on  [dbo].[KMS_STORES].order_id = [dbo].[Order_Status].order_id
where [dbo].[Order_Status].status = 'returned'

------- If the delivery truck is the most economical but the slowest shipping method and 
Express Air is the fastest but the most expensive one, do you think the company 
appropriately spent shipping costs based on the Order Priority? Explain your answer -----------

first thing I will do is write a query that allows me to compare values in the table 

select ship_mode, order_priority, count(*) as totalorders, sum(shipping_cost) as totalshippingcost
from [dbo].[KMS_STORES]
group by ship_mode, order_priority 
order by totalorders, totalshippingcost

----focus on low priority orders and express air -----
select ship_mode, order_priority, count(*) as totalorders, sum(shipping_cost) as totalshippingcost
from [dbo].[KMS_STORES]
where ship_mode = 'express air' and order_priority = 'low'
group by ship_mode, order_priority 
order by ship_mode, order_priority

I do not think that kultra mega stores spent appriately on shipping costs.This is because express air the most expensive
shipping method was used for some low priority orders, while delivery truck, the slowest method was used for some high 
or critical priority orders.This could lead to unneccesary expense and delayed deliveries.
Reccomendation: Kultra mega stores implement rules to ensure express air is reserved only for high priority and critical orders and
delivery truck is used for low priority orders