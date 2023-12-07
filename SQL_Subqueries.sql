Subqueries
Dataset: Customers(customer_id, customer_name, city)
         Orders(order_id, customer_id, order_amount, order_date)
         Products(product_id, product_name)
         Order_Items(order_id, product_id, quantity 
    

1. Write a query to find the top 5 customers with the highest total

SELECT customer_id, total_spent
FROM (
    SELECT customer_id, SUM(order_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
    ORDER BY total_spent DESC
    LIMIT 5
) AS top_customers;



2. Retrieve the names of customers who have placed orders in the past 30 days

SELECT customer_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE DATEDIFF(NOW(), order_date) <= 30
);



3. Find the products that has been ordered atleast three times

SELECT product_name
FROM Products
WHERE product_id IN (
    SELECT product_id
    FROM Order_Items
    GROUP BY product_id
    HAVING COUNT(order_id) >= 3
);



4. Retrieve the order details for orders placed by customers from a specific city

SELECT order_id, product_id, quantity
FROM Order_Items
WHERE order_id IN (
    SELECT order_id
    FROM Orders
    WHERE customer_id IN (
        SELECT customer_id
        FROM Customers
        WHERE city = 'Mumbai'
    )
);



5. Retrieve the data for customers who have placed order for products with a price greater than 100 dollars

SELECT customer_id, customer_name
FROM Customers
WHERE customer_id IN (
    SELECT DISTINCT C.customer_id
    FROM Customers C
    JOIN Orders O ON C.customer_id = O.customer_id
    JOIN Order_Items OD ON O.order_id = OD.order_id
    JOIN Products P ON OD.product_id = P.product_id
    WHERE P.price > 100
);



6. Get the average order amount for each customer

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    (SELECT AVG(order_amount) FROM Orders o WHERE o.customer_id = c.customer_id) AS avg_order_amount
FROM
    Customers c;



7. Find the products that have never been ordered.

SELECT
    product_id,
    product_name
FROM
    Products
WHERE
    product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items);



8. Retrieve the names of the customers who have ordered on weekends

SELECT DISTINCT
    customer_name
FROM
    Customers
WHERE
    customer_id IN (
        SELECT DISTINCT
            o.customer_id
        FROM
            Orders o
        WHERE
            DATENAME(dw, o.order_date) IN ('Saturday', 'Sunday')
    );



9. Get the total order amount for each month

SELECT
    DISTINCT MONTH(order_date) AS Month,
    (SELECT SUM(order_amount) FROM Orders o WHERE MONTH(o.order_date) = MONTH(Orders.order_date)) AS TotalOrderAmount
FROM
    Orders;



10. Query to find the customer who has placed order for more that two different products.

SELECT DISTINCT
    c.customer_id,
    c.customer_name
FROM
    Customers c
WHERE
    c.customer_id IN (
        SELECT o.customer_id
        FROM Orders o
        JOIN Order_Items oi ON o.order_id = oi.order_id
        GROUP BY o.customer_id
        HAVING COUNT(DISTINCT oi.product_id) > 2
    );
         


