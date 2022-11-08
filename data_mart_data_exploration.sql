
-- Data exploration
-- which week numbers are missing from the table

DROP TABLE seq100;
CREATE TABLE seq100(x INT AUTO_INCREMENT PRIMARY KEY);
INSERT INTO seq100 VALUES (),(),(),(),(),(),(),(),(),();
INSERT INTO seq100 VALUES (),(),(),(),(),(),(),(),(),();
INSERT INTO seq100 VALUES (),(),(),(),(),(),(),(),(),();
INSERT INTO seq100 VALUES (),(),(),(),(),(),(),(),(),();
INSERT INTO seq100 VALUES (),(),(),(),(),(),(),(),(),();
INSERT INTO seq100 SELECT x+50 FROM seq100;

CREATE TABLE seq52 AS (SELECT x FROM seq100 LIMIT 52);
select * from seq52;

SELECT DISTINCT x FROM seq52 s
WHERE x NOT IN(SELECT DISTINCT week_number
FROM clean_weekly_sales);

-- How many total transactions were there for each year in the dataset

SELECT SUM(transactions) AS total_transactions, calender_year FROM clean_weekly_sales
GROUP BY calender_year;

-- What are the total sales for each region in the dataset

SELECT region, SUM(sales) AS total_sales
FROM clean_weekly_sales
GROUP BY region;

-- What is the total count of transactions for each platform

SELECT platform, COUNT(transactions) AS total_transactions
FROM clean_weekly_sales
GROUP BY platform;

-- What is the percentage of sale for Retail and for Shopify 
	
    WITH percentage AS ( SELECT 
month_number, platform, sum(sales) AS monthly_sales
FROM clean_weekly_sales
GROUP BY month_number, platform
) SELECT 
month_number,
ROUND(
100*MAX(CASE WHEN platform = 'Retail' THEN monthly_sales ELSE NULL END)/
SUM(monthly_sales), 2) AS retail_percentage,
ROUND(100*MAX(CASE WHEN platform = 'Shopify' THEN monthly_sales ELSE NULL END)/
SUM(monthly_sales), 2) AS Shopify_percentage
FROM percentage
GROUP BY month_number
ORDER BY month_number;

-- What is the percentage of sales by demographic for each year in the data set?

WITH demo_percentage AS (SELECT demographic, calender_year, sum(sales) AS total_sales
FROM clean_weekly_sales
GROUP BY demographic, calender_year)
SELECT calender_year,
ROUND(100*MAX(CASE WHEN demographic = 'Couples' THEN total_sales ELSE NULL END)/
sum(total_sales), 2) AS couples_percentage,
ROUND(100*MAX(CASE WHEN demographic = 'Families' THEN total_sales ELSE NULL END)/
sum(total_sales), 2) AS families_percentage,
ROUND(100*MAX(CASE WHEN demographic = 'Unknown' THEN total_sales ELSE NULL END)/
SUM(total_sales), 2) AS unknown_percentage
FROM demo_percentage
GROUP BY calender_year;

-- Which age_band and demographic values contribute the most to Retail Sales?

SELECT demographic, age_band, sum(sales) AS total_sales
FROM clean_weekly_sales
WHERE platform = 'Retail' 
GROUP BY demographic, age_band
ORDER BY max(total_sales) DESC







