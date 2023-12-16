SQL_Sorting
Dataset: Customers(customer_id, customer_name, city, country, occupation)
         Orders(order_id, customer_id, order_amount, order_date)
         Products(product_id, product_name, supplier_id)
         Order_Items(order_id, product_id, quantity 
         Suppliers(supplier_id, supplier_name)
         Employees(emloyee_id, first_name, last_name, salary)


1. Retrieve the customers with names starting with A and ending with n

SELECT *
FROM Customers
WHERE customer_name LIKE 'A%n';


2. Find the products with the names containing at least one digit

SELECT *
FROM Products
WHERE product_name LIKE '%[0-9]%';


3. Get the employees sorted by salary in ascending order. NULL values should appear at end.

SELECT *
FROM Employees
ORDER BY salary IS NULL, salary ASC;


4. Retrieve the customers whose names contain exactly 5 characters

SELECT * 
FROM Customers
WHERE LEN(customer_name) = 5;


5. Find the products  with the names starting with S and ending with e.

SELECT * 
FROM Produts
WHERE product_name like 'S%e';


6. Get the list of employees sorted by last name and then by first name

SELECT *
FROM Employees
ORDER BY last_name, first_name ASC;


7. Retrieve the order places on a specific date and sort by customer name in alphabetical order.

SELECT Orders.*, Customers.customer_name
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE CONVERT(DATE, order_date) = '2023-12-15'
ORDER BY Customers.customer_name;


8. Find the products with the names containing exactly three letters.

SELECT *
FROM Products
WHERE LEN(product_name) = 3;


9. Get the list of employees sorted by their salary in descending order. Null Values should appear at the beginning

SELECT *
FROM Employees
ORDER BY salary DESC, salary IS NULL;


10. Retrieve the customers whose names contain a space character

SELECT *
FROM Customers
WHERE customer_name like '% %';

OR

SELECT *
FROM Customers
WHERE CHARINDEX(' ', customer_name) > 0;

