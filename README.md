# case_study_data_mart_SQL
INTRODUCTION:
Data Dart is the latest venture of XYZ Ltd and they want help in analyzing the sales and performance of their venture. In June 2020 - large scale supply changes were made at Data Mart. All Data Mart products now use sustainable packaging methods in every single step from the farm all the way to the customer.
They help to quantify the impact of this change on the sales performance for Data Mart and its separate business areas.

STEP 1
Creating a weekly_sales table.

STEP 2
Data cleansing of the weekly_sales table.

Data Cleansing Steps Used:

1) Generated a new table in the data_mart schema named clean_weekly_sales:
Added a week_number as the second column for each week_date value, for example any value from the 1st of January to 7th of January will be 1, 8th to 14th will be 2, etc.

2) Added a month_number with the calendar month for each week_date value as the 3rd column.

3) Added a calendar_year column as the 4th column containing either 2018, 2019 or 2020 values.

4) Added a new column called age_band after the original segment column. Segregated each customer into young aduls, middle age, retirees and unknown.

5) Added a new demographic column using the following mapping for the first letter in the segment values:
segment | demographic |
C | Couples |
F | Families |
 
6) Ensured all null string values with an "unknown" string value in the original segment column as well as the new age_band and demographic columns
Generate a new avg_transaction column as the sales value divided by transactions rounded to 2 decimal places for each record.

STEP 3
Data exploration of the clean_weekly_sales table.

