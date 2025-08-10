--SQL RETAIL SALE ANALYSIS--

--DATA CLEANING
SELECT * FROM retail_sales
	WHERE
	transaction_id is null
	OR
	sale_date is null
	OR
	sale_time is null
	OR
	customer_id is null
	OR
	gender is null
	OR
	age is NULL
	OR
	category is null
	OR
	quantiy is null
	OR
	price_per_unit  is null
	OR
	cogs is null
	OR
	total_sale is null

--DELETING MISSING VALUES
DELETE * FROM retail_sales
	WHERE
	transaction_id is null
	OR
	sale_date is null
	OR
	sale_time is null
	OR
	customer_id is null
	OR
	gender is null
	OR
	age is NULL
	OR
	category is null
	OR
	quantiy is null
	OR
	price_per_unit  is null
	OR
	cogs is null
	OR
	total_sale is null

--DATA EXPLORATION
-- How many sales do we have?

SELECT COUNT(total_sale) FROM retail_sales  

-- How many unique customers do we have?

SELECT COUNT(DISTINCT(customer_id) ) FROM retail_Sales

--HOW MANY CATEGORIES DO WE HAVE?

SELECT DISTINCT(category) AS Product_Category FROM retail_sales


-- Data & Business Analysis Key Problems & Answers--

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05

SELECT *
FROM  retail_sales
		WHERE sale_date = '2022-11-05';
	
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT * 
FROM retail_sales
	WHERE category = 'Clothing'
	AND 
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	AND
	quantiy >= '3'

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

select 
	category,
	SUM(total_sale) AS net_Sales,
	COUNT (*) as total_orders
FROM retail_sales
GROUP BY 1

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
	category,
	ROUND(AVG(age), 2) as Average_Age
FROM retail_sales
	WHERE category = 'Beauty'
GROUP BY 1
 
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

Select *
FROM retail_sales
	WHERE total_sale > '1000'

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
	category,
	gender,
	COUNT(transaction_id) as Total_Orders
FROM retail_sales
GROUP BY 1, 2
ORDER BY 1

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out the best-selling month in each year

SELECT
	year,
	month,
	avg_sale
from
(
SELECT
		EXTRACT(YEAR from sale_date) AS year,
		EXTRACT(MONTH from sale_date) AS month,
		AVG(total_sale) as avg_sale,
		RANK () OVER (PARTITION BY EXTRACT(YEAR from sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
	)
	as t1
	WHERE rank = 1

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

SELECT 
	customer_id,
	SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

SELECT
	category,
	COUNT (DISTINCT customer_id) as unique_customer
FROM retail_sales
GROUP BY category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
as
(
SELECT *,
	CASE
		WHEN EXTRACT ( HOUR FROM sale_time) < 12 THEN 'MORNING' 
		WHEN EXTRACT ( HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
		ELSE 'EVENING'
	END AS shift
FROM retail_sales
)
SELECT 
	shift,
	COUNT (*) as total_sales
FROM hourly_sale
GROUP BY 1


-- Q.11 FIND THE TIME WHEN MOST SALES OCCURRED EACH DAY.

SELECT 
	sale_time,
	CASE
		WHEN EXTRACT(HOUR FROM sale_time) > 12 THEN 'MORNING'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 18 THEN 'AFTERNOON'
		ELSE 'EVENING'
		END AS time_of_day,
		COUNT (*)AS TOTAL_ORDERS,
	SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY
	sale_time,
	time_of_day
ORDER BY total_sales DESC


--Q.12 Find the common bestselling days throughout the 2 years.

WITH daily_sales AS (
	SELECT 
	sale_date,
	EXTRACT (YEAR FROM sale_date) as year,
	TO_CHAR(sale_date, 'MM-DD') AS month_day,
	SUM(total_sale) as total_sales
	FROM retail_sales
	WHERE
		EXTRACT(YEAR FROM sale_date) in (2022,2023)
	GROUP BY sale_date
),
top_days as (
	SELECT  
		year,
		month_day,
		total_sales,
		RANK () OVER (PARTITION BY year ORDER BY total_sales DESC) AS sales_rank
	FROM daily_sales
),
top_2022 AS (
	SELECT month_day FROM top_days WHERE year = '2022' AND sales_rank <= 10
),
top_2023 AS (
	SELECT month_day FROM top_days WHERE year = '2023' AND sales_rank <= 10
)
SELECT 
    t22.month_day,
    d22.total_sales AS sales_2022,
    d23.total_sales AS sales_2023
FROM 
    top_2022 t22
JOIN 
    top_2023 t23 ON t22.month_day = t23.month_day
JOIN 
    top_days d22 ON d22.year = 2022 AND d22.month_day = t22.month_day
JOIN 
    top_days d23 ON d23.year = 2023 AND d23.month_day = t23.month_day;

	
--END OF PROJECT--