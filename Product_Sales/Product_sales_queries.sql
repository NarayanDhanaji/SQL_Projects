 CREATE DATABASE Sales_Analysis;
 USE Sales_Analysis; 

SELECT * FROM product_sales; 

# 1.Find total revenue. 

SELECT ROUND(SUM(TotalPrice),2) AS Total_Revenue
FROM product_sales;  

# 2.Count total orders.

SELECT 
    COUNT(DISTINCT (OrderID)) AS Total_orders
FROM
    product_sales; 
    
# 3.Find average order value (AOV).
SELECT 
    ROUND(SUM(TotalPrice) / COUNT(DISTINCT OrderID),2) AS Avg_Order_value
FROM
    product_sales; 
    
# 4.Show top 5 products by revenue. 
SELECT 
    product, ROUND(SUM(totalprice), 2) AS Revenue
FROM
    product_sales
GROUP BY product
ORDER BY Revenue DESC
LIMIT 5; 

# 5.calculate the Revenue by region. 
SELECT 
    Region, ROUND(SUM(totalprice), 2) AS Revenue
FROM
    product_sales
GROUP BY Region
ORDER BY Revenue DESC;  

# 6.Monthly sales trend
SELECT 
    MONTH(orderdate) AS Month, ROUND(SUM(totalPrice),2) AS Monthly
FROM
    product_sales
GROUP BY MONTH(orderdate)
ORDER BY Monthly;   

# 7.Find the region wise return rate (%).
SELECT 
    Region,
    SUM(CASE
        WHEN Returned = 'Yes' THEN 1
        ELSE 0
    END) * 100.0 / COUNT(*) AS Return_Rate
FROM
    product_sales
GROUP BY Region; 

# 8.Sales by customer type.
SELECT 
    customertype, ROUND(SUM(totalprice), 2) AS Revenue
FROM
    product_sales
GROUP BY customertype;   

# 9.Promotion impact on revenue.
SELECT 
    promotion, ROUND(SUM(totalprice), 2) AS Revenue
FROM
    product_sales
GROUP BY promotion;

 # 10.Best performing salesperson. 
SELECT 
    salesperson,  ROUND(SUM(totalprice), 2) Revenue
FROM
    product_sales
GROUP BY salesperson
ORDER BY Revenue DESC;  

# 11.Find average delivery time.  

SELECT 
    ROUND(AVG(deliverydate - orderdate), 4) AS average_delivery_days
FROM
    product_sales;

# 12.Orders with delivery delay > 5 days.
SELECT 
    orderid,
    orderdate,
    deliverydate,
    DATEDIFF(deliverydate ,orderdate) AS Deliverydays
FROM
    product_sales
WHERE
    DATEDIFF(deliverydate , orderdate) > 5;  

