select * from pizza_sales


-- Total revenue
select sum(total_price) as total_revenue from pizza_sales

-- Average order value
select (sum(total_price)/count(distinct order_id)) avg_order_value from pizza_sales

-- Total pizza sold
select sum(quantity) as total_pizza_sold from pizza_sales

-- Total order
select count(distinct order_id) as total_order from pizza_sales

-- Average pizza per order
select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) from pizza_sales

-- Daily trend for total order
select datename(DW, order_date) as order_day, count(distinct order_id) as total_order
from pizza_sales
group by datename(DW, order_date)

-- Monthly trend for total order
select datename(m, order_date) as order_day, count(distinct order_id) as total_order
from pizza_sales
group by datename(m, order_date)
order by total_order desc

-- Percentage of sales by category
select pizza_category, cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) pct
from pizza_sales
group by pizza_category

-- Percentage of sales by pizza size
select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_sales,cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) pct
from pizza_sales
group by pizza_size
order by pct desc

-- Top 5 pizzas by revenue
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue desc

-- Bottom 5 pizzas by revenue
select top 5 pizza_name, sum(total_price) as total_revenue from pizza_sales
group by pizza_name
order by total_revenue

-- Top 5 pizzas by quantity
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc

-- Bottom 5 pizzas by quantity
select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity 

-- Top 5 pizzas by order
select top 5 pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by total_order desc

-- Bottom 5 pizzas by order
select top 5 pizza_name, count(distinct order_id) as total_order from pizza_sales
group by pizza_name
order by total_order 
