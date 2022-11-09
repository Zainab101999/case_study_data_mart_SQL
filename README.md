# case_study_data_mart_SQL
INTRODUCTION:
Data Mart is the latest venture of XYZ Ltd and they want help in analyzing the sales and performance of their venture.

STEP 1
Creating a weekly_sales table.

STEP 2
Data cleansing of the weekly_sales table.

Data Cleansing Steps:

1) Generating a new table in the data_mart schema named clean_weekly_sales:
Adding a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 8th to 14th will be 2, etc.

2) Adding a month_number with the calendar month for each week_date value as the 3rd column.

3) Adding a calendar_year column as the 4th column containing either 2018, 2019 or 2020 values.

4) Adding a new column called age_band after the original segment column. Segregated each customer into young aduls, middle age, retirees and unknown.

5) Adding a new demographic column using the following mapping for the first letter in the segment values:
segment | demographic |
C | Couples |
F | Families |
 
6) Ensuring all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns
Generating a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record.

STEP 3
Data exploration of the clean_weekly_sales table. Using SQL queries to answer the questions given below:

1) Which week numbers are missing from the table?
2) How many total transactions were there for each year in the dataset?
3) What are the total sales for each region in the dataset?
4) What is the total count of transactions for each platform?
5) What is the percentage of sale for Retail and for Shopify?
6) What is the percentage of sales by demographic for each year in the data set?
7) Which age_band and demographic values contribute the most to Retail Sales?
