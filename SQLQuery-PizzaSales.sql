select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price)/count(distinct(order_id)) as Avg_Order_Value from pizza_sales

select sum(quantity) as Total_Pizzas from pizza_sales

Select count(distinct order_id) Total_Orders from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_Pizza_per_order from pizza_sales

select datename(DW, order_date) as order_day, count(distinct order_id) as Total_orders from pizza_sales
group by datename(DW, order_date)

select datename(MONTH, order_date) as Month_name, count(distinct order_id) as MOnthly_orders from pizza_sales
group by datename(MONTH, order_date)
order by MOnthly_orders DESC

select pizza_category, sum(total_price) * 100 / (select sum(total_price) from pizza_sales where Month(order_date)=12) as Perc_of_Total_Sales from pizza_sales 
where Month(order_date)=12
group by pizza_category

select pizza_size, sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as Perc_of_Total_Sales from pizza_sales 
group by pizza_size
order by Perc_of_Total_Sales ASC 

select TOP 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue 

select TOP 5 pizza_name, sum(total_price) as Total_Revenue from pizza_sales
group by pizza_name
order by Total_Revenue DESC