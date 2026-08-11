use quick_commerce;
select database ();
create table customers(customer_id varchar (20) primary key);
show tables;
select count(*) from ecommerce_delivery_analytics;
DROP TABLE ecommerce_delivery_analytics;
SHOW VARIABLES LIKE 'local_infile';
USE quick_commerce;

DROP TABLE IF EXISTS ecommerce_delivery_analytics;
CREATE TABLE ecommerce_delivery_analytics (
    order_id VARCHAR(20),
    customer_id VARCHAR(20),
    platform VARCHAR(50),
    order_datetime DATETIME,
    delivery_time_minutes INT,
    product_category VARCHAR(50),
    order_value DECIMAL(10,2),
    customer_feedback VARCHAR(100),
    service_rating INT,
    delivery_delay VARCHAR(10),
    refund_requested VARCHAR(10)
);
LOAD DATA LOCAL INFILE 'C:/Users/atharva/Downloads/archive (3)/ecommerce_delivery_analytics.csv'
INTO TABLE ecommerce_delivery_analytics
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    order_id,
    customer_id,
    platform,
    @order_datetime,
    delivery_time_minutes,
    product_category,
    order_value,
    customer_feedback,
    service_rating,
    delivery_delay,
    refund_requested
)
SET order_datetime = STR_TO_DATE(@order_datetime, '%d-%m-%Y %H:%i');
use quick_commerce;
SELECT COUNT(*)
FROM ecommerce_delivery_analytics;
select * from ecommerce_delivery_analytics;
select count(*) as total_orders from ecommerce_delivery_analytics;
DESCRIBE ecommerce_delivery_analytics;
select sum(order_value) as Total_revenue from ecommerce_delivery_analytics;
select avg(order_value) as Average_order_value from ecommerce_delivery_analytics;
select max(order_value) as Highest_order_value from ecommerce_delivery_analytics;
select min(order_value) as Lowest_order_value from ecommerce_delivery_analytics;
select count(distinct customer_id) from ecommerce_delivery_analytics;
select distinct Platform from ecommerce_delivery_analytics;
select Platform, sum(order_value) as Revenue_Generated from ecommerce_delivery_analytics
group by platform;
select Platform, sum(order_value) as Revenue_Generated from ecommerce_delivery_analytics
group by platform order by sum(order_value) desc;
select Product_Category , sum(order_value) as Revenue_generated from ecommerce_delivery_analytics
group by Product_Category order by Revenue_generated desc;
select Platform , count(Order_ID) as Number_of_orders from ecommerce_delivery_analytics
group by platform;
select Product_Category , sum(order_value) as Total_revenue from ecommerce_delivery_analytics
group by Product_Category
having total_revenue > 1000000;
select Platform , Count(Refund_Requested) as Refunded_orders from ecommerce_delivery_analytics
where Refund_Requested like '%yes%'
group by Platform;
select Platform, avg(Service_Rating) as Average_service_rating from ecommerce_delivery_analytics
group by platform order by average_service_rating desc ;
select Platform, avg(Delivery_Time_Minutes) as Average_delivery_time from ecommerce_delivery_analytics
group by platform
order by Average_delivery_time desc;
select platform, count(delivery_delay) as Delayed_orders from ecommerce_delivery_analytics
where delivery_delay like '%yes%' group by platform
order by Delayed_orders desc;
Select Platform, Count(*) AS Total_Orders,
SUM(CASE WHEN delivery_delay like '%yes%'
THEN 1 ELSE 0
    END
) AS Delayed_Orders
FROM ecommerce_delivery_analytics
GROUP BY Platform;
select customer_id , sum(Order_Value) as Spent_amount from ecommerce_delivery_analytics
group by customer_id 
order by Spent_amount desc
limit 5;
select product_category , avg(Order_Value) as Average_order_value from ecommerce_delivery_analytics
group by product_category
order by Average_order_value desc
limit 1;
select platform, avg(service_rating) As Average_service_rating from ecommerce_delivery_analytics
group by platform
having avg(service_rating) > 3;
select platform, count(*) as total_orders, sum(order_value) as Total_revenue, avg(order_value)as
 average_order_value from ecommerce_delivery_analytics
group by platform;
 select customer_id , count(*) as number_of_orders from ecommerce_delivery_analytics
 group by customer_id 
 order by number_of_orders desc
 limit 1;
select platform, count(*) as Total_orders, 
sum( case 
when refund_requested like '%yes%' then 1 
else 0 
end) as refunded_orders from ecommerce_delivery_analytics 
group by platform;
select platform , avg(service_rating) as average_service_rating from ecommerce_delivery_analytics
 group by platform 
 order by avg(service_rating) 
 limit 1;
 select customer_id, sum(order_value) as least_spent from ecommerce_delivery_analytics
 group by customer_id
 order by sum(order_value) 
 limit 1 ;
 select product_category ,sum(order_value) as Highest_total_revenue from ecommerce_delivery_analytics
 group by product_category
 order by sum(order_value) desc
 limit 1;
 select platform, max(order_value) as Highest_order_value from ecommerce_delivery_analytics
 group by platform
 order by max(order_value) desc
 ;
 select customer_id, sum(order_value) as Highest_spent from ecommerce_delivery_analytics
 group by customer_id 
 order by sum(order_value) desc
 limit 1;
 select platform , avg(order_value) as average_order_value from ecommerce_delivery_analytics
 group by platform
 having avg(order_value) > 500;
select product_category , count(*) as number_of_orders from ecommerce_delivery_analytics
group by product_category
having  count(*) >10000;
select platform, sum(order_value) as Total_revenue,avg(service_rating) as average_rating
 from ecommerce_delivery_analytics
group by platform
;
select customer_id , sum(order_value) as total_spent from ecommerce_delivery_analytics
group by customer_id 
order by sum(order_value) desc
limit 3;
select platform ,sum(order_value) as total_revenue from ecommerce_delivery_analytics
group by platform
order by sum(order_value)
limit 1
 ;
 select product_category , avg(order_value) as average_revenue from ecommerce_delivery_analytics
group by product_category
order by avg(order_value) desc
limit 1;
select platform, count(*) as No_of_orders , 
sum( case when delivery_delay like '%yes%' then 1 else 0
end) as delayed_orders from ecommerce_delivery_analytics
group by platform;
select platform, avg(delivery_time_minutes) as Average_delivery_time from ecommerce_delivery_analytics
group by platform
having avg(delivery_time_minutes) > 20;
select platform , sum(order_value) as Total_revenue from ecommerce_delivery_analytics
group by platform
having total_revenue >1000000;
select platform, count(*) as total_orders ,
sum( case when refund_requested like '%yes%' then 1 else 0
end ) as Number_of_refunds from ecommerce_delivery_analytics
group by platform;
select product_category, sum(order_value) as total_revenue, count(*) as Total_orders from ecommerce_delivery_analytics
group by product_category;
select platform, avg(service_rating) as average_service_rating from ecommerce_delivery_analytics
group by platform
order by avg(service_rating )desc
limit 1 ;
select platform, count(*) as total_orders,
sum( case when delivery_delay like '%yes%' then 1 else 0
end) as Delivery_delay , SUM(
        CASE
            WHEN delivery_delay LIKE '%yes%' THEN 1
            ELSE 0
        END
    ) / COUNT(*) * 100 AS delay_percentage from ecommerce_delivery_analytics
group by platform;
select product_category , sum(order_value) as total_revenue from ecommerce_delivery_analytics
group by product_category
order by sum(order_value) desc
limit 3;
select customer_id , sum(order_value) from ecommerce_delivery_analytics
group by customer_id 
order by sum(order_value) asc
limit 1;
select product_category, max(order_value) as Highest_spend from ecommerce_delivery_analytics
group by product_category;
select platform, count(*) as Total_orders from ecommerce_delivery_analytics
group by platform
order by count(*) desc
limit 1;
select customer_id , avg(order_value) as Average_spend from ecommerce_delivery_analytics
group by customer_id;
select customer_id , sum(order_value) as Total_spend from ecommerce_delivery_analytics
group by customer_id
having sum(order_value) > 10000;
select customer_id, count(*) as Total_orders from ecommerce_delivery_analytics
group by customer_id
order by count(*) desc
limit 5;
select platform, min(order_value) as Minimum_order_value from ecommerce_delivery_analytics
group by platform;
select product_category, avg(order_value) as Average_order_value from ecommerce_delivery_analytics
group by product_category
order by avg(order_value) 
limit 1;
select platform, avg(order_value) as Average_order_value from ecommerce_delivery_analytics
group by platform
order by avg(order_value) desc
limit 1;
select customer_id , max(order_value) as Highest_order from ecommerce_delivery_analytics
group by customer_Id
order by max(order_value) desc
limit 1;
select platform,
sum( case when refund_requested like '%yes%' then 1 else 0
end) as Total_refunds from ecommerce_delivery_analytics
group by platform;
select product_category, sum(order_value) highest_total_value from ecommerce_delivery_analytics
group by product_category
order by sum(order_value) desc
limit 1;
select customer_id, max(order_value) as highest_value from ecommerce_delivery_analytics
group by customer_id;
select platform, avg(delivery_time_minutes) as average_delivery_time from ecommerce_delivery_analytics
group by platform
having avg(delivery_time_minutes) < 30;
select customer_id, count(*) as total_orders, sum(order_value) as total_spend from ecommerce_delivery_analytics
group by customer_id
having count(*) >=5
order by sum(order_value) desc
limit 3;
select platform, sum(order_value) as Total_revenue, count(*) as Total_orders, avg(delivery_time_minutes) as Average_delivery_time
, avg(service_rating) as average_service_rating from ecommerce_delivery_analytics
group by platform;
select product_category, sum(order_value) as Total_revenue, count(*) Total_orders from ecommerce_delivery_analytics
group by product_category;
select product_category, avg(order_value) as Average_order_value from ecommerce_delivery_analytics
group by product_category
order by avg(order_value) desc;
select customer_id , sum(order_value) from ecommerce_delivery_analytics
group by customer_id
order by sum(order_value) desc
limit 10;
select platform, count(*) as Total_orders, sum(case when refund_requested like '%yes%' then 1 else 0
end) as refund_orders,
 sum( case when refund_requested like '%yes%'then 1 else 0 end) /count(*) * 100 as Refund_percentage 
 from ecommerce_delivery_analytics
 group by platform;
 
select platform,count(*) as Total_orders,  sum( case when delivery_delay like '%yes%' then 1 else 0 end) as Delayed_orders,
  sum( case when delivery_delay like '%yes%' then 1 else 0 end)/ count(*) *100 as Delay_percentage 
  from ecommerce_delivery_analytics
  group by platform;
 SELECT
    COUNT(*) / COUNT(DISTINCT customer_id) AS average_orders_per_customer
FROM ecommerce_delivery_analytics;
select platform, avg(order_value) as average_order_value from ecommerce_delivery_analytics
group by platform;
select platform, sum(order_value)/count(*) as Total_revemue_per_order from ecommerce_delivery_analytics
group by platform
order by sum(order_value)/count(*) desc
limit 1;
select product_category, sum(order_value)/count(*) as Total_revenue_per_order from ecommerce_delivery_analytics
group by product_category
order by sum(order_value)/count(*)  desc
limit 1 ;
select platform, sum(order_value) as Total_revenue , count(*) as Total_orders, AVg(order_value) as average_Order_value,
avg(delivery_time_minutes) as average_delivery_time, avg(service_rating) as average_service_rating , sum(case when refund_requested like '%yes%' then 1 else 0
end) as refund_orders,
 sum( case when refund_requested like '%yes%'then 1 else 0 end) /count(*) * 100 as Refund_percentage,sum( case when delivery_delay like '%yes%' then 1 else 0 end) as Delayed_orders,
  sum( case when delivery_delay like '%yes%' then 1 else 0 end)/ count(*) *100 as Delay_percentage from ecommerce_delivery_analytics
  group by platform;
