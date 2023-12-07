SQL_Joins
Dataset: Customers(customer_id, customer_name, city, country)
         Orders(order_id, customer_id, order_amount, order_date)
         Products(product_id, product_name, supplier_id)
         Order_Items(order_id, product_id, quantity 
         Suppliers(supplier_id, supplier_name)


1. Retrieve order details along with each order's customer name and product name.

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    oi.order_id AS order_item_id
FROM
    Orders o
JOIN
    Customers c ON o.customer_id = c.customer_id
JOIN
    Order_Items oi ON o.order_id = oi.order_id
JOIN
    Products p ON oi.product_id = p.product_id;


2. Find the products and their corresponding supplier names

SELECT
    p.product_id,
    p.product_name,
    s.supplier_name
FROM
    Products p
JOIN
    Suppliers s ON p.supplier_id = s.supplier_id;


3. Get the list of customers who have never placed an order

SELECT
    c.customer_id,
    c.customer_name
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
WHERE
    o.customer_id IS NULL;


4. Retrieve the names of the customers along with the total quantity of products they ordered

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity) AS total_quantity_ordered
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
LEFT JOIN
    Order_Items oi ON o.order_id = oi.order_id
GROUP BY
    c.customer_id, c.customer_name;


5. Find the product that the customers ordered from a specific country

SELECT
    p.product_id,
    p.product_name,
    c.customer_id,
    c.customer_name
FROM
    Products p
JOIN
    Order_Items oi ON p.product_id = oi.product_id
JOIN
    Orders o ON oi.order_id = o.order_id
JOIN
    Customers c ON o.customer_id = c.customer_id
WHERE
    c.country = 'India';  
