CREATE DATABASE retail_sales_db;
USE retail_sales_db;

ALTER TABLE sales_data
CHANGE `Row ID` row_id INT,
CHANGE `Order ID` order_id VARCHAR(50),
CHANGE `Order Date` order_date VARCHAR(20),
CHANGE `Ship Date` ship_date VARCHAR(20),
CHANGE `Ship Mode` ship_mode VARCHAR(50),
CHANGE `Customer ID` customer_id VARCHAR(50),
CHANGE `Customer Name` customer_name VARCHAR(100),
CHANGE `Segment` segment VARCHAR(50),
CHANGE `Country` country VARCHAR(50),
CHANGE `City` city VARCHAR(50),
CHANGE `State` state VARCHAR(50),
CHANGE `Postal Code` postal_code VARCHAR(20),
CHANGE `Region` region VARCHAR(50),
CHANGE `Product ID` product_id VARCHAR(50),
CHANGE `Category` category VARCHAR(50),
CHANGE `Sub-Category` sub_category VARCHAR(50),
CHANGE `Product Name` product_name VARCHAR(255),
CHANGE `Sales` sales FLOAT,
CHANGE `Quantity` quantity INT,
CHANGE `Discount` discount FLOAT,
CHANGE `Profit` profit FLOAT;

SET SQL_SAFE_UPDATES = 0;

UPDATE sales_data
SET order_date = STR_TO_DATE(order_date, '%m/%d/%Y'),
    ship_date = STR_TO_DATE(ship_date, '%m/%d/%Y');
    
ALTER TABLE sales_data
MODIFY order_date DATE,
MODIFY ship_date DATE;

SELECT order_date, ship_date FROM sales_data LIMIT 5;

SELECT 
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data;


SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

SELECT 
    product_name,
    SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS monthly_sales
FROM sales_data
GROUP BY year, month
ORDER BY year, month;

SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;