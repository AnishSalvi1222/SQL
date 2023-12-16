SQL Aggregation & Grouping
Dataset: Customers(customer_id, customer_name, city, country, occupation)
         Orders(order_id, customer_id, order_amount, order_date)
         Products(product_id, product_name, supplier_id, category_id)
         Order_Items(order_id, product_id, quantity 
         Suppliers(supplier_id, supplier_name)
         Employees(emloyee_id, first_name, last_name, salary, age, job_title)
         Categories(category_id, category_name)
         Reviews(product_id, rating)

1. Calculate the total quantity and total amount for each order

SELECT 
    Orders.order_id,
    SUM(Order_Items.quantity) AS total_quantity,
    SUM(Orders.order_amount) AS total_amount
FROM 
    Orders
JOIN 
    Order_Items ON Orders.order_id = Order_Items.order_id
GROUP BY 
    Orders.order_id;


2. Find the average age and the number of employees for each job title

SELECT 
    job_title,
    AVG(CONVERT(float, age)) AS average_age,
    COUNT(employee_id) AS num_employees
FROM 
    Employees
GROUP BY 
    job_title;


3. Get the total number of products in each category

SELECT
    Categories.category_id,
    Categories.category_name,
    COUNT(Products.product_id) AS total_products
FROM
    Categories
LEFT JOIN
    Products ON Categories.category_id = Products.category_id
GROUP BY
    Categories.category_id, Categories.category_name;


4. Calculate the average rating and number of reviews for each product

SELECT
    Products.product_id,
    Products.product_name,
    AVG(Reviews.rating) AS average_rating,
    COUNT(Reviews.product_id) AS num_reviews
FROM
    Products
LEFT JOIN
    Reviews ON Products.product_id = Reviews.product_id
GROUP BY
    Products.product_id, Products.product_name;


5. Find the customer with the highest and the lowest total order amounts

HIGHEST

SELECT TOP 1
    Customers.customer_id,
    Customers.customer_name,
    SUM(Orders.order_amount) AS total_order_amount
FROM
    Customers
JOIN
    Orders ON Customers.customer_id = Orders.customer_id
GROUP BY
    Customers.customer_id, Customers.customer_name
ORDER BY
    total_order_amount DESC;

LOWEST

SELECT TOP 1
    Customers.customer_id,
    Customers.customer_name,
    SUM(Orders.order_amount) AS total_order_amount
FROM
    Customers
JOIN
    Orders ON Customers.customer_id = Orders.customer_id
GROUP BY
    Customers.customer_id, Customers.customer_name
ORDER BY
    total_order_amount ASC;



