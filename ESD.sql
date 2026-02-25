USE ecommerce;
select * from ESD;
  #--checking from duplication of values
select ID 
from ESD
group by ID
having count(*)>1;

#--Analyzing the distribution of warehouse block
select * from ESD;
select Warehouse_block ,COUNT(*) as blockcount
from ESD
group by Warehouse_block
order by blockcount desc;
 
 #Shippment Mode distribution
 select * FROM ESD;
 select Mode_of_Shipment, COUNT(*) AS ShipmentCOUNT
 from ESD
 group by Mode_of_Shipment
 order by ShipmentCOUNT;
 
 #--customer rating distribution
  select * FROM ESD;
  select Customer_rating, count(*) as ratingcount
  from ESD
  group by customer_rating
  order by customer_rating;
  
#--product importance
select product_importance, count(*) as Importancecount
from ESD
GROUP BY  product_importance
ORDER BY  Importancecount DESC;

#--Gender Distribution
select * from ESD;
select Gender ,COUNT(*) AS GenderCount
from ESD
group by Gender;


#--ON TIME VS LATE_DELIVERIES<> ------- 
select Reached_on_Time, COUNT(*) AS DeliveryCount
from ESD
group by Reached_on_Time;


#---Average DISCOUNT  by delivery status
select * from ESD;
select Reached_on_Time, AVG(Discount_offered) as AvgDiscount
from ESD
Group by Reached_on_Time;


#--AVERAGE PRODUCT COST BY DELIVERY DATE
select Reached_on_Time, AVG(Cost_of_the_product) AS Avgcost
from ESD
Group by Reached_on_Time;


  #Customer Rating satisfaction
SELECT Customer_Rating,
       CASE Customer_Rating
           WHEN 5 THEN 'Excellent'
           WHEN 4 THEN 'Good'
           WHEN 3 THEN 'Average'
           ELSE 'Poor'
       END AS Rating_Category
FROM ESD;


#---RISKS OF DELAY IN WAREHOUSE BLOCK  
SELECT 
    Warehouse_block, 
    SUM(CASE WHEN Reached_on_Time_Y_N = 'Y' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DelayPercentage
FROM ESD
GROUP BY Warehouse_block
ORDER BY DelayPercentage DESC; 

 
 #---shippment mode with most delays
 select Mode_of_shipment, SUM(CASE WHEN Reached_on_Time ='Y' THEN 1 ELSE 0 END) * 100/ COUNT(*) AS DelayPercentage
 from ESD
 GROUP BY Mode_of_shipment
 ORDER BY DelayPercentage DESC;
 
 #----combining shipment mode and product inportance
 SELECT Mode_of_Shipment,
    Product_importance,
    COUNT(*) AS TotalShipments,
    SUM(CASE WHEN Reached_on_Time = 1 THEN 1 ELSE 0 END) AS DelayedShipments,
    SUM(CASE WHEN Reached_on_Time = 1 THEN 1 ELSE 0 END) * 100 / COUNT(*) AS DelayPercentage
FROM ESD
GROUP BY Mode_of_Shipment, Product_importance
ORDER BY DelayPercentage DESC;

select * from ESD










 
